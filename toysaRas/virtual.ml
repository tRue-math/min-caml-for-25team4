(* translation into assembly with infinite number of virtual registers *)

open Asm

let data = ref [] (* 浮動小数点数の定数テーブル (caml2html: virtual_data) *)

let classify xts ini addf addi =
  List.fold_left
    (fun acc (x, t) ->
      match t with
      | Type.Unit -> acc
      | Type.Float -> addf acc x
      | _ -> addi acc x t)
    ini
    xts

let separate xts =
  classify
    xts
    ([], [])
    (fun (int, float) x -> (int, float @ [x]))
    (fun (int, float) x _ -> (int @ [x], float))

let expand xts ini addf addi =
  classify
    xts
    ini
    (fun (offset, acc) x ->
      let offset = align offset in
      (offset + 4, addf x offset acc))
    (fun (offset, acc) x t ->
      (offset + 4, addi x t offset acc))

let rec g env ({v=e;pos}:Closure.t) = (* 式の仮想マシンコード生成 (caml2html: virtual_g) *)
  let set_pos e = ({v=e;pos} :t) in match e with
  | Closure.Unit -> set_pos (Ans(Nop))
  | Closure.Int(i) -> set_pos (Ans(Set(i)))
  | Closure.Float(d) ->
      let l =
        try
          (* すでに定数テーブルにあったら再利用 Cf. https://github.com/esumii/min-caml/issues/13 *)
          let (l, _) = List.find (fun (_, d') -> d = d') !data in
          l
        with Not_found ->
          let l = Id.L(Id.genid "l") in
          data := (l, d) :: !data;
          l in
      let x = Id.genid "l" in
      set_pos (Let((x, Type.Int), SetL(l), set_pos (Ans(LdF(x, 0)))))
  | Closure.Neg(x) -> set_pos (Ans(Neg(x)))
  | Closure.Add(x, y) -> set_pos (Ans(Add(x, V(y))))
  | Closure.Sub(x, y) -> set_pos (Ans(Sub(x, V(y))))
  | Closure.FNeg(x) -> set_pos (Ans(FNeg(x)))
  | Closure.FAdd(x, y) -> set_pos (Ans(FAdd(x, y)))
  | Closure.FSub(x, y) -> set_pos (Ans(FSub(x, y)))
  | Closure.FMul(x, y) -> set_pos (Ans(FMul(x, y)))
  | Closure.FDiv(x, y) -> set_pos (Ans(FDiv(x, y)))
  | Closure.IfEq(x, y, e1, e2) ->
      (match M.find x env with
      | Type.Bool | Type.Int -> set_pos (Ans(IfEq(x, V(y), g env e1, g env e2)))
      | Type.Float -> set_pos (Ans(IfFEq(x, y, g env e1, g env e2)))
      | _ -> failwith "equality supported only for bool, int, and float")
  | Closure.IfLE(x, y, e1, e2) ->
      (match M.find x env with
      | Type.Bool | Type.Int -> set_pos (Ans(IfLE(x, V(y), g env e1, g env e2)))
      | Type.Float -> set_pos (Ans(IfFLE(x, y, g env e1, g env e2)))
      | _ -> failwith "inequality supported only for bool, int, and float")
  | Closure.Let((x, t1), e1, e2) ->
      let e1' = g env e1 in
      let e2' = g (M.add x t1 env) e2 in
      concat e1' (x, t1) e2'
  | Closure.Var(x) ->
      (match M.find x env with
      | Type.Unit -> set_pos (Ans(Nop))
      | Type.Float -> set_pos (Ans(FMov(x)))
      | _ -> set_pos (Ans(Mov(x))))
  | Closure.MakeCls((x, t), { Closure.entry = l; Closure.actual_fv = ys }, e2) -> (* クロージャの生成 (caml2html: virtual_makecls) *)
      (* Closureのアドレスをセットしてから、自由変数の値をストア *)
      let e2' = g (M.add x t env) e2 in
      let offset, store_fv =
        expand
          (List.map (fun y -> (y, M.find y env)) ys)
          (4, e2')
          (fun y offset store_fv -> seq(StF(y, x, offset), store_fv))
          (fun y _ offset store_fv -> seq(St(y, x, offset), store_fv)) in
      set_pos (Let((x, t), Mov(reg_hp),
          set_pos (Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
              let z = Id.genid "l" in
              set_pos (Let((z, Type.Int), SetL(l),
                  seq(St(z, x, 0),
                      store_fv)))))))
  | Closure.AppCls(x, ys) ->
      let (int, float) = separate (List.map (fun y -> (y, M.find y env)) ys) in
      set_pos (Ans(CallCls(x, int, float)))
  | Closure.AppDir(Id.L(x), ys) ->
      let (int, float) = separate (List.map (fun y -> (y, M.find y env)) ys) in
      set_pos (Ans(CallDir(Id.L(x), int, float)))
  | Closure.Tuple(xs) -> (* 組の生成 (caml2html: virtual_tuple) *)
      let y = Id.genid "t" in
      let (offset, store) =
        expand
          (List.map (fun x -> (x, M.find x env)) xs)
          (0, set_pos (Ans(Mov(y))))
          (fun x offset store -> seq(StF(x, y, offset), store))
          (fun x _ offset store -> seq(St(x, y, offset), store)) in
      set_pos (Let((y, Type.Tuple(List.map (fun x -> M.find x env) xs)), Mov(reg_hp),
          set_pos (Let((reg_hp, Type.Int), Add(reg_hp, C(align offset)),
              store))))
  | Closure.LetTuple(xts, y, e2) ->
      let s = Closure.fv e2 in
      let (offset, load) =
        expand
          xts
          (0, g (M.add_list xts env) e2)
          (fun x offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            fletd(x, LdF(y, offset), load))
          (fun x t offset load ->
            if not (S.mem x s) then load else (* [XX] a little ad hoc optimization *)
            set_pos (Let((x, t), Ld(y, offset), load))) in
      load
  | Closure.Get(x, y) -> (* 配列の読み出し (caml2html: virtual_get) *)
      (match M.find x env with
      | Type.Array(Type.Unit) -> set_pos (Ans(Nop))
      | Type.Array(Type.Float) -> set_pos (Ans(LdFArray(x, y)))
      | Type.Array(_) -> set_pos (Ans(LdArray(x, y)))
      | _ -> assert false)
  | Closure.Put(x, y, z) ->
      (match M.find x env with
      | Type.Array(Type.Unit) -> set_pos (Ans(Nop))
      | Type.Array(Type.Float) -> set_pos (Ans(StFArray(x, y, z)))
      | Type.Array(_) -> set_pos (Ans(StArray(x, y, z)))
      | _ -> assert false)
  | Closure.ExtArray(Id.L(x)) -> set_pos (Ans(SetL(Id.L("min_caml_" ^ x))))

(* 関数の仮想マシンコード生成 (caml2html: virtual_h) *)
let h { Closure.name = (Id.L(x), t); Closure.args = yts; Closure.formal_fv = zts; Closure.body = {v=_;pos} as e } =
  let (int, float) = separate yts in
  let (offset, load) =
    expand
      zts
      (4, g (M.add x t (M.add_list yts (M.add_list zts M.empty))) e)
      (fun z offset load -> fletd(z, LdF(x, offset), load))
      (fun z t offset load -> {v=(Let((z, t), Ld(x, offset), load));pos}) in
  match t with
  | Type.Fun(_, t2) ->
      { name = Id.L(x); args = int; fargs = float; body = load; ret = t2 }
  | _ -> assert false

(* プログラム全体の仮想マシンコード生成 (caml2html: virtual_f) *)
let f (Closure.Prog(fundefs, e)) =
  data := [];
  let fundefs = List.map h fundefs in
  let e = g M.empty e in
  Prog(!data, fundefs, e)

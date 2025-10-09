(* give names to intermediate values (K-normalization) *)
(* K正規化後の式 (caml2html: knormal_t) *)
type t = {v: node; pos: Lexing.position}
and node =
  | Unit
  | Int of int
  | Float of float
  | Neg of Id.t
  | Add of Id.t * Id.t
  | Sub of Id.t * Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | IfEq of Id.t * Id.t * t * t (* 比較 + 分岐 (caml2html: knormal_branch) *)
  | IfLE of Id.t * Id.t * t * t (* 比較 + 分岐 *)
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fundef * t
  | App of Id.t * Id.t list
  | Tuple of Id.t list
  | LetTuple of (Id.t * Type.t) list * Id.t * t
  | Get of Id.t * Id.t
  | Put of Id.t * Id.t * Id.t
  | ExtArray of Id.t
  | ExtFunApp of Id.t * Id.t list
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

(* 式に出現する（自由な）変数 (caml2html: knormal_fv) *)
let rec fv {v=e;_} = match e with
  | Unit | Int(_) | Float(_) | ExtArray(_) -> S.empty
  | Neg(x) | FNeg(x) -> S.singleton x
  | Add(x, y) | Sub(x, y) | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) | Get(x, y) -> S.of_list [x; y]
  | IfEq(x, y, e1, e2) | IfLE(x, y, e1, e2) -> S.add x (S.add y (S.union (fv e1) (fv e2)))
  | Let((x, _), e1, e2) -> S.union (fv e1) (S.remove x (fv e2))
  | Var(x) -> S.singleton x
  | LetRec({ name = (x, _); args = yts; body = e1 }, e2) ->
      let zs = S.diff (fv e1) (S.of_list (List.map fst yts)) in
      S.diff (S.union zs (fv e2)) (S.singleton x)
  | App(x, ys) -> S.of_list (x :: ys)
  | Tuple(xs) | ExtFunApp(_, xs) -> S.of_list xs
  | Put(x, y, z) -> S.of_list [x; y; z]
  | LetTuple(xs, y, e) -> S.add y (S.diff (fv e) (S.of_list (List.map fst xs)))

let insert_let ({v=e;pos}, t) k = (* letを挿入する補助関数 (caml2html: knormal_insert) *)
  match e with
  | Var(x) -> k x
  | _ ->
      let x = Id.gentmp t in
      let e', t' = k x in
      {v=Let((x, t), {v=e;pos}, e');pos}, t'

(* K正規化ルーチン本体 (caml2html: knormal_g) *)
let rec g env ({v=e;pos}: Syntax.t) = 
  let set_pos e = {v=e;pos} in match e with
  | Syntax.Unit -> set_pos Unit, Type.Unit
  | Syntax.Bool(b) -> set_pos (Int(if b then 1 else 0)), Type.Int (* 論理値true, falseを整数1, 0に変換 (caml2html: knormal_bool) *)
  | Syntax.Int(i) -> set_pos (Int(i)), Type.Int
  | Syntax.Float(d) -> set_pos (Float(d)), Type.Float
  | Syntax.Not(e) -> g env {v=(Syntax.If(e, {v=Syntax.Bool(false);pos}, {v=Syntax.Bool(true);pos}));pos}
  | Syntax.Neg(e) ->
      insert_let (g env e)
        (fun x -> set_pos (Neg(x)), Type.Int)
  | Syntax.Add(e1, e2) -> (* 足し算のK正規化 (caml2html: knormal_add) *)
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> set_pos (Add(x, y)), Type.Int))
  | Syntax.Sub(e1, e2) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> set_pos (Sub(x, y)), Type.Int))
  | Syntax.FNeg(e) ->
      insert_let (g env e)
        (fun x -> set_pos (FNeg(x)), Type.Float)
  | Syntax.FAdd(e1, e2) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> set_pos (FAdd(x, y)), Type.Float))
  | Syntax.FSub(e1, e2) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> set_pos (FSub(x, y)), Type.Float))
  | Syntax.FMul(e1, e2) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> set_pos (FMul(x, y)), Type.Float))
  | Syntax.FDiv(e1, e2) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> set_pos (FDiv(x, y)), Type.Float))
  | Syntax.Eq (_,_) | Syntax.LE (_,_) as cmp ->
      g env {v=Syntax.If({v=cmp;pos}, {v=Syntax.Bool(true);pos}, {v=Syntax.Bool(false);pos});pos}
  | Syntax.If({v=Syntax.Not(e1);_}, e2, e3) -> g env {v=Syntax.If(e1, e3, e2);pos} (* notによる分岐を変換 (caml2html: knormal_not) *)
  | Syntax.If({v=Syntax.Eq(e1, e2);_}, e3, e4) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y ->
              let e3', t3 = g env e3 in
              let e4', _ = g env e4 in
              set_pos (IfEq(x, y, e3', e4')), t3))
  | Syntax.If({v=Syntax.LE(e1, e2);_}, e3, e4) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y ->
              let e3', t3 = g env e3 in
              let e4', _ = g env e4 in
              set_pos (IfLE(x, y, e3', e4')), t3))
  | Syntax.If(e1, e2, e3) -> g env 
        {v=Syntax.If({v=Syntax.Eq(e1, {v=Syntax.Bool(false);pos});pos}, e3, e2);pos} (* 比較のない分岐を変換 (caml2html: knormal_if) *)
  | Syntax.Let((x, t), e1, e2) ->
      let e1', _ = g env e1 in
      let e2', t2 = g (M.add x t env) e2 in
      set_pos (Let((x, t), e1', e2')), t2
  | Syntax.Var(x) when M.mem x env -> set_pos (Var(x)), M.find x env
  | Syntax.Var(x) -> (* 外部配列の参照 (caml2html: knormal_extarray) *)
      (match M.find x !Typing.extenv with
      | Type.Array(_) as t -> set_pos (ExtArray x), t
      | _ -> failwith (Printf.sprintf "external variable %s does not have an array type" x))
  | Syntax.LetRec({ Syntax.name = (x, t); Syntax.args = yts; Syntax.body = e1 }, e2) ->
      let env' = M.add x t env in
      let e2', t2 = g env' e2 in
      let e1', _ = g (M.add_list yts env') e1 in
      set_pos (LetRec({ name = (x, t); args = yts; body = e1' }, e2')), t2
  | Syntax.App({v=Syntax.Var(f);_}, e2s) when not (M.mem f env) -> (* 外部関数の呼び出し (caml2html: knormal_extfunapp) *)
      (match M.find f !Typing.extenv with
      | Type.Fun(_, t) ->
          let rec bind xs = function (* "xs" are identifiers for the arguments *)
            | [] -> set_pos (ExtFunApp(f, xs)), t
            | e2 :: e2s ->
                insert_let (g env e2)
                  (fun x -> bind (xs @ [x]) e2s) in
          bind [] e2s (* left-to-right evaluation *)
      | _ -> assert false)
  | Syntax.App(e1, e2s) ->
      (match g env e1 with
      | _, Type.Fun(_, t) as g_e1 ->
          insert_let g_e1
            (fun f ->
              let rec bind xs = function (* "xs" are identifiers for the arguments *)
                | [] -> set_pos (App(f, xs)), t
                | e2 :: e2s ->
                    insert_let (g env e2)
                      (fun x -> bind (xs @ [x]) e2s) in
              bind [] e2s) (* left-to-right evaluation *)
      | _ -> assert false)
  | Syntax.Tuple(es) ->
      let rec bind xs ts = function (* "xs" and "ts" are identifiers and types for the elements *)
        | [] -> set_pos (Tuple(xs)), Type.Tuple(ts)
        | e :: es ->
            let _, t as g_e = g env e in
            insert_let g_e
              (fun x -> bind (xs @ [x]) (ts @ [t]) es) in
      bind [] [] es
  | Syntax.LetTuple(xts, e1, e2) ->
      insert_let (g env e1)
        (fun y ->
          let e2', t2 = g (M.add_list xts env) e2 in
          set_pos (LetTuple(xts, y, e2')), t2)
  | Syntax.Array(e1, e2) ->
      insert_let (g env e1)
        (fun x ->
          let _, t2 as g_e2 = g env e2 in
          insert_let g_e2
            (fun y ->
              let l =
                match t2 with
                | Type.Float -> "create_float_array"
                | _ -> "create_array" in
              set_pos (ExtFunApp(l, [x; y])), Type.Array(t2)))
  | Syntax.Get(e1, e2) ->
      (match g env e1 with
      |        _, Type.Array(t) as g_e1 ->
          insert_let g_e1
            (fun x -> insert_let (g env e2)
                (fun y -> set_pos (Get(x, y)), t))
      | _ -> assert false)
  | Syntax.Put(e1, e2, e3) ->
      insert_let (g env e1)
        (fun x -> insert_let (g env e2)
            (fun y -> insert_let (g env e3)
                (fun z -> set_pos (Put(x, y, z)), Type.Unit)))

let f e = fst (g M.empty e)


let print_expr oc (e : t) =
  let rec to_string {v=e;_} = match e with
    | Unit -> "()"
    | Int(i) -> Printf.sprintf "INT %d" i
    | Float(d) -> Printf.sprintf "FLOAT %f" d
    | Neg(e) -> Printf.sprintf "-%s" e
    | Add(e1, e2) -> Printf.sprintf "%s + %s" e1 e2
    | Sub(e1, e2) -> Printf.sprintf "%s - %s" e1 e2
    | FNeg(e) -> Printf.sprintf "-%s" e
    | FAdd(e1, e2) -> Printf.sprintf "%s +. %s" e1 e2
    | FSub(e1, e2) -> Printf.sprintf "%s -. %s" e1 e2
    | FMul(e1, e2) -> Printf.sprintf "%s *. %s" e1 e2
    | FDiv(e1, e2) -> Printf.sprintf "%s /. %s" e1 e2
    | IfEq(e1, e2, e3, e4) -> Printf.sprintf "%s == %s ? %s : %s" e1 e2 (to_string e3) (to_string e4)
    | IfLE(e1, e2, e3, e4) -> Printf.sprintf "%s <= %s ? %s : %s" e1 e2 (to_string e3) (to_string e4)
    | Let((x, _), e1, e2) -> Printf.sprintf "LET %s = %s\nin\n%s" x (to_string e1) (to_string e2)
    | Var(x) -> Printf.sprintf "VAR %s" x
    | LetRec({ name = (x, _); args = yts; body = e1 }, e2) ->
        let args_str = String.concat ", " (List.map (fun (y, _) -> y) yts) in
        Printf.sprintf "LETREC %s [%s] = %s\nin\n%s" x args_str (to_string e1) (to_string e2)
    | App(e, es) ->
        let es_str = String.concat ", " es in
        Printf.sprintf "APP(%s, [%s])" e es_str
    | Tuple(es) ->
        let es_str = String.concat ", " es in
        Printf.sprintf "Tuple([%s])" es_str
    | LetTuple(xts, e1, e2) ->
        let xts_str = String.concat ", " (List.map (fun (x, _) -> Printf.sprintf "(%s, %s)" x "TypeVar") xts) in
        Printf.sprintf "LetTuple([%s], %s, %s)" xts_str e1 (to_string e2)
    | Get(e1, e2) -> Printf.sprintf "Get(%s, %s)" e1 e2
    | Put(e1, e2, e3) -> Printf.sprintf "Put(%s, %s, %s)" e1 e2 e3
    | ExtArray(e1) -> Printf.sprintf "ExtArray %s" e1
    | ExtFunApp(f, es) -> Printf.sprintf "ExtFunApp(%s, [%s])" f (String.concat ", " es)
  in
  Printf.fprintf oc "%s\n" (to_string e)
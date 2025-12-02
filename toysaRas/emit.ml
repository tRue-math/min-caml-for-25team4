open Asm

let stackset = ref S.empty (* すでにSaveされた変数の集合 (caml2html: emit_stackset) *)
let stackmap = ref [] (* Saveされた変数の、スタックにおける位置 (caml2html: emit_stackmap) *)
let save x =
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    stackmap := !stackmap @ [x]
let savef x =
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    (let pad =
      if List.length !stackmap mod 2 = 0 then [] else [Id.gentmp Type.Int] in
    stackmap := !stackmap @ pad @ [x; x])
let locate x =
  let rec loc = function
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
  loc !stackmap
let offset x = -4 * (List.hd (locate x) + 1)
let stacksize () = List.length !stackmap * 4

(* 関数呼び出しのために引数を並べ替える(register shuffling) (caml2html: emit_shuffle) *)
let rec shuffle sw xys =
  (* remove identical moves *)
  let _, xys = List.partition (fun (x, y) -> x = y) xys in
  (* find acyclic moves *)
  match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
  | [], [] -> []
  | (x, y) :: xys, [] -> (* no acyclic moves; resolve a cyclic move *)
      (y, sw) :: (x, y) :: shuffle sw (List.map
                                         (function
                                           | (y', z) when y = y' -> (sw, z)
                                           | yz -> yz)
                                         xys)
  | xys, acyc -> acyc @ shuffle sw xys

let imm x = "$" ^ string_of_int x

let rec to_string_list = function
  | h :: [] -> h
  | h :: t -> h ^ " " ^ to_string_list t
  | [] -> ""

let emit pos oc lis =
  let s = to_string_list lis in
  Printf.fprintf oc "%s" s;
  let padding_len = 32 - String.length s in
  let padding = if padding_len > 0 then String.make padding_len ' ' else "\t" in
  Printf.fprintf oc "%s# %d\n" padding pos.Lexing.pos_lnum

type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)
let rec g oc (dest,({v=e;pos}:t)) = match dest,e with (* 命令列のアセンブリ生成 (caml2html: emit_g) *)
  | dest, Ans(exp) -> g' oc (dest, exp) pos
  | dest, Let((x, t), exp, e) ->
      g' oc (NonTail(x), exp) pos;
      g oc (dest, e)
and g' oc (dest,e) pos = match dest,e with (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
  (* 末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
  | NonTail(_), Nop -> ()
  | NonTail(x), Set(i) -> emit pos oc ["\taddi";x;"x0";imm i]
  | NonTail(x), SetL(Id.L(y)) -> emit pos oc ["\taddi";x;"x0";"$"^y]
  | NonTail(x), Mov(y) ->
      if x <> y then emit pos oc ["\taddi";x;y;"$0"]
  | NonTail(x), Neg(y) ->
      if x <> y then emit pos oc ["\tsub";x;"x0";y]
  | NonTail(x), Add(y, z') ->
      (match z' with
      | V(z) -> emit pos oc ["\tadd";x;y;z]
      | C(i) -> emit pos oc ["\taddi";x;y;imm i])
  | NonTail(x), Sub(y, z') ->
      (match z' with
      | V(z) -> emit pos oc ["\tsub";x;y;z]
      | C(i) -> emit pos oc ["\taddi";x;y;imm (-i)])
  | NonTail(x), Ld(y, i) -> emit pos oc ["\tlw";x;y;imm i]
  | NonTail(_), St(x, y, i) -> emit pos oc ["\tsw";x;y;imm i]
  | NonTail(x), FMov(y) ->
      if x <> y then emit pos oc ["\tfsgnj";x;y;y]
  | NonTail(x), FNeg(y) -> emit pos oc ["\tfsgnjn";x;y;y]
  | NonTail(x), FAdd(y, z) -> emit pos oc ["\tfadd";x;y;z]
  | NonTail(x), FSub(y, z) -> emit pos oc ["\tfsub";x;y;z]
  | NonTail(x), FMul(y, z) -> emit pos oc ["\tfmul";x;y;z]
  | NonTail(x), FDiv(y, z) -> emit pos oc ["\tfdiv";x;y;z]
  | NonTail(x), LdF(y, i) -> emit pos oc ["\tflw\t";x;y;imm i]
  | NonTail(_), StF(x, y, i) -> emit pos oc ["\tfsw";x;y;imm i]
  | NonTail(x), LdArray(y, z) -> emit pos oc ["\tslli";reg_sw;z;"$2"];
                              emit pos oc ["\tadd";reg_sw;y;reg_sw];
                              emit pos oc ["\tlw";x;reg_sw;"$0"]
  | NonTail(_), StArray(x, y, z) -> emit pos oc ["\tslli";reg_sw;y;"$2"];
                              emit pos oc ["\tadd";reg_sw;x;reg_sw;];
                              emit pos oc ["\tsw";z;reg_sw;"$0"]
  | NonTail(x), LdFArray(y, z) -> emit pos oc ["\tslli";reg_sw;z;"$2"];
                              emit pos oc ["\tadd";reg_sw;y;reg_sw];
                              emit pos oc ["\tflw";x;reg_sw;"$0"]
  | NonTail(_), StFArray(x, y, z) -> emit pos oc ["\tslli";reg_sw;y;"$2"];
                              emit pos oc ["\tadd";reg_sw;x;reg_sw];
                              emit pos oc ["\tfsw";z;reg_sw;"$0"]
  | NonTail(_), Comment(s) -> emit pos oc ["\t# ";s]
  (* 退避の仮想命令の実装 (caml2html: emit_save) *)
  | NonTail(_), Save(x, y) when List.mem x (reg_cl :: allregs) && not (S.mem y !stackset) ->
      save y;
      emit pos oc ["\tsw";x;reg_sp;imm (offset y)]
  | NonTail(_), Save(x, y) when List.mem x allfregs && not (S.mem y !stackset) ->
      savef y;
      emit pos oc ["\tfsw";x;reg_sp;imm (offset y)]
  | NonTail(_), Save(x, y) -> assert (S.mem y !stackset); ()
  (* 復帰の仮想命令の実装 (caml2html: emit_restore) *)
  | NonTail(x), Restore(y) when List.mem x (reg_cl :: allregs) ->
      emit pos oc ["\tlw";x;reg_sp;imm (offset y)]
  | NonTail(x), Restore(y) ->
      assert (List.mem x allfregs);
      emit pos oc ["\tflw";x;reg_sp;imm (offset y)]
  (* 末尾だったら計算結果を第一レジスタにセットしてret (caml2html: emit_tailret) *)
  | Tail, (Nop | St _ | StF _ | StArray _ | StFArray _ | Comment _ | Save _ as exp) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp) pos;
      emit pos oc ["\tjalr";"x0";reg_ra;"$0"];
  | Tail, (Set _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | Ld _ | LdArray _ as exp) ->
      g' oc (NonTail(regs.(0)), exp) pos;
      emit pos oc ["\tjalr";"x0";reg_ra;"$0"];
  | Tail, (FMov _ | FNeg _ | FAdd _ | FSub _ | FMul _ | FDiv _ | LdF _ | LdFArray _  as exp) ->
      g' oc (NonTail(fregs.(0)), exp) pos;
      emit pos oc ["\tjalr";"x0";reg_ra;"$0"];
  | Tail, (Restore(x) as exp) ->
      (match locate x with
      | [i] -> g' oc (NonTail(regs.(0)), exp) pos
      | [i; j] when i + 1 = j -> g' oc (NonTail(fregs.(0)), exp) pos
      | _ -> assert false);
      emit pos oc ["\tjalr";"x0";reg_ra;"$0"]
  | Tail, IfEq(x, V(y), e1, e2) ->
      g'_tail_if pos oc "beq" x y e1 e2
  | Tail, IfEq(x, C(y), e1, e2) ->
      emit pos oc ["\txori";reg_sw;x;imm y];
      g'_tail_if pos oc "beq" reg_sw "x0" e1 e2;
  | Tail, IfGE(x, V(y), e1, e2) ->
      g'_tail_if pos oc "bge" x y e1 e2
  | Tail, IfGE(x, C(y), e1, e2) ->
      emit pos oc ["\tslti";reg_sw;x;imm y];
      g'_tail_if pos oc "beq" reg_sw "x0" e1 e2
  | Tail, IfLE(x, V(y), e1, e2) ->
      g'_tail_if pos oc "bge" y x e1 e2
  | Tail, IfLE(x, C(y), e1, e2) ->
      emit pos oc ["\taddi";reg_sw;x;imm (-y)];
      g'_tail_if pos oc "bge" "x0" reg_sw e1 e2
  | Tail, IfFEq(x, y, e1, e2) ->
      emit pos oc ["\tfeq";reg_sw;x;y];
      g'_tail_if pos oc "bne" reg_sw "x0" e1 e2
  | Tail, IfFLE(x, y, e1, e2) ->
      emit pos oc ["\tfle";reg_sw;x;y];
      g'_tail_if pos oc "bne" reg_sw "x0" e1 e2
  | NonTail(z), IfEq(x, V(y), e1, e2) ->
      g'_non_tail_if pos oc (NonTail(z)) e1 e2 "beq" x y
  | NonTail(z), IfEq(x, C(y), e1, e2) ->
      emit pos oc ["\txori";reg_sw;x;imm y];
      g'_non_tail_if pos oc (NonTail(z)) e1 e2 "beq" reg_sw "x0"
  | NonTail(z), IfGE(x, V(y), e1, e2) ->
      g'_non_tail_if pos oc (NonTail(z)) e1 e2 "bge" x y
  | NonTail(z), IfGE(x, C(y), e1, e2) ->
      emit pos oc ["\tslti";reg_sw;x;imm y];
      g'_non_tail_if pos oc (NonTail(z)) e1 e2 "beq" reg_sw "x0"
  | NonTail(z), IfLE(x, V(y), e1, e2) ->
      g'_non_tail_if pos oc (NonTail(z)) e1 e2 "bge" y x
  | NonTail(z), IfLE(x, C(y), e1, e2) ->
      emit pos oc ["\taddi";reg_sw;x;imm (-y)];
      g'_non_tail_if pos oc (NonTail(z)) e1 e2 "bge" "x0" reg_sw
  | NonTail(w), IfFEq(x, y, e1, e2) ->
      emit pos oc ["\tfeq";reg_sw;x;y];
      g'_non_tail_if pos oc (NonTail(w)) e1 e2 "bne" reg_sw "x0"
  | NonTail(w), IfFLE(x, y, e1, e2) ->
      emit pos oc ["\tfle";reg_sw;x;y];
      g'_non_tail_if pos oc (NonTail(w)) e1 e2 "bne" reg_sw "x0"
  (* 関数呼び出しの仮想命令の実装 (caml2html: emit_call) *)
  | Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
      g'_args oc [(x, reg_cl)] ys zs pos;
      emit pos oc ["\tlw";reg_sw;reg_cl;"$0"];
      emit pos oc ["\tjalr";"x0";reg_sw;"$0"];
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
      g'_args oc [] ys zs pos;
      emit pos oc ["\tjal";"x0";"$"^x];
  | NonTail(a), CallCls(x, ys, zs) ->
      g'_args oc [(x, reg_cl)] ys zs pos;
      let ss = stacksize () in
      emit pos oc ["\tsw";reg_ra;reg_sp;imm (-ss-4)];
      emit pos oc ["\taddi";reg_sp;reg_sp;imm (-ss-4)];
      emit pos oc ["\tlw";reg_sw;reg_cl;"$0"];
      emit pos oc ["\tjalr";reg_ra;reg_sw;"$0"];
      emit pos oc ["\taddi";reg_sp;reg_sp;imm (ss+4)];
      emit pos oc ["\tlw";reg_ra;reg_sp;imm (-ss-4)];
      if List.mem a allregs && a <> regs.(0) then
        emit pos oc ["\taddi";a;regs.(0);"$0"]
      else if List.mem a allfregs && a <> fregs.(0) then
        emit pos oc ["\tfsgnj";a;fregs.(0);fregs.(0)]
  | NonTail(a), CallDir(Id.L(x), ys, zs) ->
      g'_args oc [] ys zs pos;
      let ss = stacksize () in
      emit pos oc ["\tsw";reg_ra;reg_sp;imm (-ss-4)];
      emit pos oc ["\taddi";reg_sp;reg_sp;imm (-ss-4)];
      emit pos oc ["\tjal";reg_ra;"$"^x];
      emit pos oc ["\taddi";reg_sp;reg_sp;imm (ss+4)];
      emit pos oc ["\tlw";reg_ra;reg_sp;imm (-ss-4)];
      if List.mem a allregs && a <> regs.(0) then
        emit pos oc ["\taddi";a;regs.(0);"$0"]
      else if List.mem a allfregs && a <> fregs.(0) then
        emit pos oc ["\tfsgnj";a;fregs.(0);fregs.(0)]
and g'_tail_if pos oc b_inst x y e1 e2 =
  let b_then = Id.genid (b_inst ^ "_then") in
  emit pos oc ["\t"^b_inst;x;y;"$"^b_then];
  let stackset_back = !stackset in
  g oc (Tail, e2);
  emit pos oc [b_then^":"];
  stackset := stackset_back;
  g oc (Tail, e1)
and g'_non_tail_if pos oc dest e1 e2 b_inst x y =
  let b_then = Id.genid (b_inst ^ "_then") in
  let b_cont = Id.genid (b_inst ^"_cont") in
  emit pos oc ["\t"^b_inst;x;y;"$"^b_then];
  let stackset_back = !stackset in
  g oc (dest, e2);
  let stackset1 = !stackset in
  emit pos oc ["\tjal";"x0";"$"^b_cont];
  emit pos oc [b_then^":"];
  stackset := stackset_back;
  g oc (dest, e1);
  emit pos oc [b_cont^":"];
  let stackset2 = !stackset in
  stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs pos =
  assert (List.length ys <= Array.length regs - List.length x_reg_cl);
  assert (List.length zs <= Array.length fregs);
  let sw = reg_sw in
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> emit pos oc ["\taddi";r;y;"$0"])
    (shuffle sw yrs);
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) -> emit pos oc ["\tfsgnj";fr;z;z])
    (shuffle sw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = {v=_;pos}as e; ret = _ } =
  emit pos oc [x^":"];
  stackset := S.empty;
  stackmap := [];
  g oc (Tail, e)

let f oc (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  stackset := S.empty;
  stackmap := [];
  g oc (NonTail(regs.(0)), e);
  Printf.fprintf oc "\tjal x0 $0\n";
  List.iter
    (fun (Id.L(x), d) ->
      Printf.fprintf oc "%s:\t# %f\n" x d;
      Printf.fprintf oc "\t.data\t%d\n" (Int32.to_int (Int32.bits_of_float d))
      (* Printf.fprintf oc "\t.long\t0x%lx\n" (gethi d);
      Printf.fprintf oc "\t.long\t0x%lx\n" (getlo d) *)
      )
    data;
  List.iter (fun fundef -> h oc fundef) fundefs;

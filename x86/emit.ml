open Asm

external gethi : float -> int32 = "gethi"
external getlo : float -> int32 = "getlo"

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
let offset x = 4 * List.hd (locate x)
let stacksize () = align (List.length !stackmap * 4)

let pp_id_or_imm = function
  | V(x) -> x
  | C(i) -> "$" ^ string_of_int i

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

let emit pos oc fmt =
  let cont s =
    Printf.fprintf oc "%s" s;
    let padding_len = 32 - String.length s in
    let padding = if padding_len > 0 then String.make padding_len ' ' else "\t" in
    Printf.fprintf oc "%s# %d\n" padding pos.Lexing.pos_lnum
  in
  Printf.ksprintf cont fmt

type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)
let rec g oc (dest,({v=e;pos}:t)) = match dest,e with (* 命令列のアセンブリ生成 (caml2html: emit_g) *)
  | dest, Ans(exp) -> g' oc (dest, exp) pos
  | dest, Let((x, t), exp, e) ->
      g' oc (NonTail(x), exp) pos;
      g oc (dest, e)
and g' oc (dest,e) pos = match dest,e with (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
  (* 末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
  | NonTail(_), Nop -> ()
  | NonTail(x), Set(i) -> emit pos oc "\tmovl\t$%d, %s" i x
  | NonTail(x), SetL(Id.L(y)) -> emit pos oc "\tmovl\t$%s, %s" y x
  | NonTail(x), Mov(y) ->
      if x <> y then emit pos oc "\tmovl\t%s, %s" y x
  | NonTail(x), Neg(y) ->
      if x <> y then emit pos oc "\tmovl\t%s, %s" y x;
      emit pos oc "\tnegl\t%s" x
  | NonTail(x), Add(y, z') ->
      if V(x) = z' then
        emit pos oc "\taddl\t%s, %s" y x
      else
        (if x <> y then emit pos oc "\tmovl\t%s, %s" y x;
         emit pos oc "\taddl\t%s, %s" (pp_id_or_imm z') x)
  | NonTail(x), Sub(y, z') ->
      if V(x) = z' then
        (emit pos oc "\tsubl\t%s, %s" y x;
         emit pos oc "\tnegl\t%s" x)
      else
        (if x <> y then emit pos oc "\tmovl\t%s, %s" y x;
         emit pos oc "\tsubl\t%s, %s" (pp_id_or_imm z') x)
  | NonTail(x), Ld(y, V(z), i) -> emit pos oc "\tmovl\t(%s,%s,%d), %s" y z i x
  | NonTail(x), Ld(y, C(j), i) -> emit pos oc "\tmovl\t%d(%s), %s" (j * i) y x
  | NonTail(_), St(x, y, V(z), i) -> emit pos oc "\tmovl\t%s, (%s,%s,%d)" x y z i
  | NonTail(_), St(x, y, C(j), i) -> emit pos oc "\tmovl\t%s, %d(%s)" x (j * i) y
  | NonTail(x), FMovD(y) ->
      if x <> y then emit pos oc "\tmovsd\t%s, %s" y x
  | NonTail(x), FNegD(y) ->
      if x <> y then emit pos oc "\tmovsd\t%s, %s" y x;
      emit pos oc "\txorpd\tmin_caml_fnegd, %s" x
  | NonTail(x), FAddD(y, z) ->
      if x = z then
        emit pos oc "\taddsd\t%s, %s" y x
      else
        (if x <> y then emit pos oc "\tmovsd\t%s, %s" y x;
         emit pos oc "\taddsd\t%s, %s" z x)
  | NonTail(x), FSubD(y, z) ->
      if x = z then (* [XXX] ugly *)
        let ss = stacksize () in
        emit pos oc "\tmovsd\t%s, %d(%s)" z ss reg_sp;
        if x <> y then emit pos oc "\tmovsd\t%s, %s" y x;
        emit pos oc "\tsubsd\t%d(%s), %s" ss reg_sp x
      else
        (if x <> y then emit pos oc "\tmovsd\t%s, %s" y x;
         emit pos oc "\tsubsd\t%s, %s" z x)
  | NonTail(x), FMulD(y, z) ->
      if x = z then
        emit pos oc "\tmulsd\t%s, %s" y x
      else
        (if x <> y then emit pos oc "\tmovsd\t%s, %s" y x;
         emit pos oc "\tmulsd\t%s, %s" z x)
  | NonTail(x), FDivD(y, z) ->
      if x = z then (* [XXX] ugly *)
        let ss = stacksize () in
        emit pos oc "\tmovsd\t%s, %d(%s)" z ss reg_sp;
        if x <> y then emit pos oc "\tmovsd\t%s, %s" y x;
        emit pos oc "\tdivsd\t%d(%s), %s" ss reg_sp x
      else
        (if x <> y then emit pos oc "\tmovsd\t%s, %s" y x;
         emit pos oc "\tdivsd\t%s, %s" z x)
  | NonTail(x), LdDF(y, V(z), i) -> emit pos oc "\tmovsd\t(%s,%s,%d), %s" y z i x
  | NonTail(x), LdDF(y, C(j), i) -> emit pos oc "\tmovsd\t%d(%s), %s" (j * i) y x
  | NonTail(_), StDF(x, y, V(z), i) -> emit pos oc "\tmovsd\t%s, (%s,%s,%d)" x y z i
  | NonTail(_), StDF(x, y, C(j), i) -> emit pos oc "\tmovsd\t%s, %d(%s)" x (j * i) y
  | NonTail(_), Comment(s) -> emit pos oc "\t# %s" s
  (* 退避の仮想命令の実装 (caml2html: emit_save) *)
  | NonTail(_), Save(x, y) when List.mem x allregs && not (S.mem y !stackset) ->
      save y;
      emit pos oc "\tmovl\t%s, %d(%s)" x (offset y) reg_sp
  | NonTail(_), Save(x, y) when List.mem x allfregs && not (S.mem y !stackset) ->
      savef y;
      emit pos oc "\tmovsd\t%s, %d(%s)" x (offset y) reg_sp
  | NonTail(_), Save(x, y) -> assert (S.mem y !stackset); ()
  (* 復帰の仮想命令の実装 (caml2html: emit_restore) *)
  | NonTail(x), Restore(y) when List.mem x allregs ->
      emit pos oc "\tmovl\t%d(%s), %s" (offset y) reg_sp x
  | NonTail(x), Restore(y) ->
      assert (List.mem x allfregs);
      emit pos oc "\tmovsd\t%d(%s), %s" (offset y) reg_sp x
  (* 末尾だったら計算結果を第一レジスタにセットしてret (caml2html: emit_tailret) *)
  | Tail, (Nop | St _ | StDF _ | Comment _ | Save _ as exp) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp) pos;
      emit pos oc "\tret";
  | Tail, (Set _ | SetL _ | Mov _ | Neg _ | Add _ | Sub _ | Ld _ as exp) ->
      g' oc (NonTail(regs.(0)), exp) pos;
      emit pos oc "\tret";
  | Tail, (FMovD _ | FNegD _ | FAddD _ | FSubD _ | FMulD _ | FDivD _ | LdDF _  as exp) ->
      g' oc (NonTail(fregs.(0)), exp) pos;
      emit pos oc "\tret";
  | Tail, (Restore(x) as exp) ->
      (match locate x with
      | [i] -> g' oc (NonTail(regs.(0)), exp) pos
      | [i; j] when i + 1 = j -> g' oc (NonTail(fregs.(0)), exp) pos
      | _ -> assert false);
      emit pos oc "\tret";
  | Tail, IfEq(x, y', e1, e2) ->
      emit pos oc "\tcmpl\t%s, %s" (pp_id_or_imm y') x;
      g'_tail_if oc e1 e2 "je" "jne" pos
  | Tail, IfLE(x, y', e1, e2) ->
      emit pos oc "\tcmpl\t%s, %s" (pp_id_or_imm y') x;
      g'_tail_if oc e1 e2 "jle" "jg" pos
  | Tail, IfGE(x, y', e1, e2) ->
      emit pos oc "\tcmpl\t%s, %s" (pp_id_or_imm y') x;
      g'_tail_if oc e1 e2 "jge" "jl" pos
  | Tail, IfFEq(x, y, e1, e2) ->
      emit pos oc "\tcomisd\t%s, %s" y x;
      g'_tail_if oc e1 e2 "je" "jne" pos
  | Tail, IfFLE(x, y, e1, e2) ->
      emit pos oc "\tcomisd\t%s, %s" y x;
      g'_tail_if oc e1 e2 "jbe" "ja" pos
  | NonTail(z), IfEq(x, y', e1, e2) ->
      emit pos oc "\tcmpl\t%s, %s" (pp_id_or_imm y') x;
      g'_non_tail_if oc (NonTail(z)) e1 e2 "je" "jne" pos
  | NonTail(z), IfLE(x, y', e1, e2) ->
      emit pos oc "\tcmpl\t%s, %s" (pp_id_or_imm y') x;
      g'_non_tail_if oc (NonTail(z)) e1 e2 "jle" "jg" pos
  | NonTail(z), IfGE(x, y', e1, e2) ->
      emit pos oc "\tcmpl\t%s, %s" (pp_id_or_imm y') x;
      g'_non_tail_if oc (NonTail(z)) e1 e2 "jge" "jl" pos
  | NonTail(z), IfFEq(x, y, e1, e2) ->
      emit pos oc "\tcomisd\t%s, %s" y x;
      g'_non_tail_if oc (NonTail(z)) e1 e2 "je" "jne" pos
  | NonTail(z), IfFLE(x, y, e1, e2) ->
      emit pos oc "\tcomisd\t%s, %s" y x;
      g'_non_tail_if oc (NonTail(z)) e1 e2 "jbe" "ja" pos
  (* 関数呼び出しの仮想命令の実装 (caml2html: emit_call) *)
  | Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
      g'_args oc [(x, reg_cl)] ys zs pos;
      emit pos oc "\tjmp\t*(%s)" reg_cl;
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
      g'_args oc [] ys zs pos;
      emit pos oc "\tjmp\t%s" x;
  | NonTail(a), CallCls(x, ys, zs) ->
      g'_args oc [(x, reg_cl)] ys zs pos;
      let ss = stacksize () in
      if ss > 0 then emit pos oc "\taddl\t$%d, %s" ss reg_sp;
      emit pos oc "\tcall\t*(%s)" reg_cl;
      if ss > 0 then emit pos oc "\tsubl\t$%d, %s" ss reg_sp;
      if List.mem a allregs && a <> regs.(0) then
        emit pos oc "\tmovl\t%s, %s" regs.(0) a
      else if List.mem a allfregs && a <> fregs.(0) then
        emit pos oc "\tmovsd\t%s, %s" fregs.(0) a
  | NonTail(a), CallDir(Id.L(x), ys, zs) ->
      g'_args oc [] ys zs pos;
      let ss = stacksize () in
      if ss > 0 then emit pos oc "\taddl\t$%d, %s" ss reg_sp;
      emit pos oc "\tcall\t%s" x;
      if ss > 0 then emit pos oc "\tsubl\t$%d, %s" ss reg_sp;
      if List.mem a allregs && a <> regs.(0) then
        emit pos oc "\tmovl\t%s, %s" regs.(0) a
      else if List.mem a allfregs && a <> fregs.(0) then
        emit pos oc "\tmovsd\t%s, %s" fregs.(0) a
and g'_tail_if oc e1 e2 b bn pos =
  let b_else = Id.genid (b ^ "_else") in
  emit pos oc "\t%s\t%s" bn b_else;
  let stackset_back = !stackset in
  g oc (Tail, e1);
  emit pos oc "%s:" b_else;
  stackset := stackset_back;
  g oc (Tail, e2)
and g'_non_tail_if oc dest e1 e2 b bn pos =
  let b_else = Id.genid (b ^ "_else") in
  let b_cont = Id.genid (b ^ "_cont") in
  emit pos oc "\t%s\t%s" bn b_else;
  let stackset_back = !stackset in
  g oc (dest, e1);
  let stackset1 = !stackset in
  emit pos oc "\tjmp\t%s" b_cont;
  emit pos oc "%s:" b_else;
  stackset := stackset_back;
  g oc (dest, e2);
  emit pos oc "%s:" b_cont;
  let stackset2 = !stackset in
  stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs pos =
  assert (List.length ys <= Array.length regs - List.length x_reg_cl);
  assert (List.length zs <= Array.length fregs);
  let sw = Printf.sprintf "%d(%s)" (stacksize ()) reg_sp in
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> emit pos oc "\tmovl\t%s, %s" y r)
    (shuffle sw yrs);
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) -> emit pos oc "\tmovsd\t%s, %s" z fr)
    (shuffle sw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = {v=_;pos}as e; ret = _ } =
  emit pos oc "%s:" x;
  stackset := S.empty;
  stackmap := [];
  g oc (Tail, e)

let f oc (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  Printf.fprintf oc ".data\n";
  Printf.fprintf oc ".balign\t8\n";
  List.iter
    (fun (Id.L(x), d) ->
      Printf.fprintf oc "%s:\t# %f\n" x d;
      Printf.fprintf oc "\t.long\t0x%lx\n" (gethi d);
      Printf.fprintf oc "\t.long\t0x%lx\n" (getlo d))
    data;
  Printf.fprintf oc ".text\n";
  List.iter (fun fundef -> h oc fundef) fundefs;
  Printf.fprintf oc ".globl\tmin_caml_start\n";
  Printf.fprintf oc "min_caml_start:\n";
  Printf.fprintf oc ".globl\t_min_caml_start\n";
  Printf.fprintf oc "_min_caml_start: # for cygwin\n";
  Printf.fprintf oc "\tpushl\t%%eax\n";
  Printf.fprintf oc "\tpushl\t%%ebx\n";
  Printf.fprintf oc "\tpushl\t%%ecx\n";
  Printf.fprintf oc "\tpushl\t%%edx\n";
  Printf.fprintf oc "\tpushl\t%%esi\n";
  Printf.fprintf oc "\tpushl\t%%edi\n";
  Printf.fprintf oc "\tpushl\t%%ebp\n";
  Printf.fprintf oc "\tmovl\t32(%%esp),%s\n" reg_sp;
  Printf.fprintf oc "\tmovl\t36(%%esp),%s\n" regs.(0);
  Printf.fprintf oc "\tmovl\t%s,%s\n" regs.(0) reg_hp;
  stackset := S.empty;
  stackmap := [];
  g oc (NonTail(regs.(0)), e);
  Printf.fprintf oc "\tpopl\t%%ebp\n";
  Printf.fprintf oc "\tpopl\t%%edi\n";
  Printf.fprintf oc "\tpopl\t%%esi\n";
  Printf.fprintf oc "\tpopl\t%%edx\n";
  Printf.fprintf oc "\tpopl\t%%ecx\n";
  Printf.fprintf oc "\tpopl\t%%ebx\n";
  Printf.fprintf oc "\tpopl\t%%eax\n";
  Printf.fprintf oc "\tret\n";

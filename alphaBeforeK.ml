open Syntax

let find x env = try M.find x env with Not_found -> x

let rec g env ({v=e;pos}) = (* α変換ルーチン本体 (caml2html: alpha_g) *)
  let set_pos e = {v=e;pos} in match e with
  | Not(e) -> set_pos (Not(g env e))
  | Neg(e) -> set_pos (Neg(g env e))
  | Add(e1, e2) -> set_pos (Add(g env e1, g env e2))
  | Sub(e1, e2) -> set_pos (Sub(g env e1, g env e2))
  | FNeg(e) -> set_pos (FNeg(g env e))
  | FAdd(e1, e2) -> set_pos (FAdd(g env e1, g env e2))
  | FSub(e1, e2) -> set_pos (FSub(g env e1, g env e2))
  | FMul(e1, e2) -> set_pos (FMul(g env e1, g env e2))
  | FDiv(e1, e2) -> set_pos (FDiv(g env e1, g env e2))
  | Eq(e1, e2) -> set_pos (Eq(g env e1, g env e2))
  | LE(e1, e2) -> set_pos (LE(g env e1, g env e2))
  | If(e1, e2, e3) -> set_pos (If(g env e1, g env e2, g env e3))
  | Let((x, t), e1, e2) -> (* letのα変換 (caml2html: alpha_let) *)
      let x' = Id.genid x in
      set_pos (Let((x', t), g env e1, g (M.add x x' env) e2))
  | Var(x) -> set_pos (Var(find x env))
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) -> (* let recのα変換 (caml2html: alpha_letrec) *)
      let env = M.add x (Id.genid x) env in
      let ys = List.map fst yts in
      let env' = M.add_list2 ys (List.map Id.genid ys) env in
      set_pos (LetRec({ name = (find x env, t);
               args = List.map (fun (y, t) -> (find y env', t)) yts;
               body = g env' e1 },
             g env e2))
  | App(x, ys) -> set_pos (App(g env x, List.map (fun y -> g env y) ys))
  | Tuple(xs) -> set_pos (Tuple(List.map (fun x -> g env x) xs))
  | LetTuple(xts, y, e) -> (* LetTupleのα変換 (caml2html: alpha_lettuple) *)
      let xs = List.map fst xts in
      let env' = M.add_list2 xs (List.map Id.genid xs) env in
      set_pos (LetTuple(List.map (fun (x, t) -> (find x env', t)) xts,
               g env e,
               g env' e))
  | Array(e1, e2) -> set_pos (Array(g env e1, g env e2))
  | Get(e1, e2) -> set_pos (Get(g env e1, g env e2))
  | Put(e1, e2, e3) -> set_pos (Put(g env e1, g env e2, g env e3))
  | e -> set_pos e

let f = g M.empty

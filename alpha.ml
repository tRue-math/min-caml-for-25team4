(* rename identifiers to make them unique (alpha-conversion) *)

open KNormal

let find x env = try M.find x env with Not_found -> x

let rec g env ({v=e;pos}) = (* α変換ルーチン本体 (caml2html: alpha_g) *)
  let set_pos e = {v=e;pos} in match e with
  | Unit -> set_pos Unit
  | Int(i) -> set_pos (Int(i))
  | Float(d) -> set_pos (Float(d))
  | Neg(x) -> set_pos (Neg(find x env))
  | Add(x, y) -> set_pos (Add(find x env, find y env))
  | Sub(x, y) -> set_pos (Sub(find x env, find y env))
  | FNeg(x) -> set_pos (FNeg(find x env))
  | FAdd(x, y) -> set_pos (FAdd(find x env, find y env))
  | FSub(x, y) -> set_pos (FSub(find x env, find y env))
  | FMul(x, y) -> set_pos (FMul(find x env, find y env))
  | FDiv(x, y) -> set_pos (FDiv(find x env, find y env))
  | IfEq(x, y, e1, e2) -> set_pos (IfEq(find x env, find y env, g env e1, g env e2))
  | IfLE(x, y, e1, e2) -> set_pos (IfLE(find x env, find y env, g env e1, g env e2))
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
  | App(x, ys) -> set_pos (App(find x env, List.map (fun y -> find y env) ys))
  | Tuple(xs) -> set_pos (Tuple(List.map (fun x -> find x env) xs))
  | LetTuple(xts, y, e) -> (* LetTupleのα変換 (caml2html: alpha_lettuple) *)
      let xs = List.map fst xts in
      let env' = M.add_list2 xs (List.map Id.genid xs) env in
      set_pos (LetTuple(List.map (fun (x, t) -> (find x env', t)) xts,
               find y env,
               g env' e))
  | Get(x, y) -> set_pos (Get(find x env, find y env))
  | Put(x, y, z) -> set_pos (Put(find x env, find y env, find z env))
  | ExtArray(x) -> set_pos (ExtArray(x))
  | ExtFunApp(x, ys) -> set_pos (ExtFunApp(x, List.map (fun y -> find y env) ys))

let f = g M.empty

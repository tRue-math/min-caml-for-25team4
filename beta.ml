open KNormal

let find x env = try M.find x env with Not_found -> x (* 置換のための関数 (caml2html: beta_find) *)

let rec g env {v=e;pos} = (* β簡約ルーチン本体 (caml2html: beta_g) *)
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
  | Let((x, t), e1, e2) -> (* letのβ簡約 (caml2html: beta_let) *)
      (match g env e1 with
      | {v=Var(y);_} ->
          Format.eprintf "beta-reducing %s = %s@." x y;
          g (M.add x y env) e2
      | e1' ->
          let e2' = g env e2 in
          set_pos (Let((x, t), e1', e2')))
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
      set_pos (LetRec({ name = xt; args = yts; body = g env e1 }, g env e2))
  | Var(x) -> set_pos (Var(find x env)) (* 変数を置換 (caml2html: beta_var) *)
  | Tuple(xs) -> set_pos (Tuple(List.map (fun x -> find x env) xs))
  | LetTuple(xts, y, e) -> set_pos (LetTuple(xts, find y env, g env e))
  | Get(x, y) -> set_pos (Get(find x env, find y env))
  | Put(x, y, z) -> set_pos (Put(find x env, find y env, find z env))
  | App(g, xs) -> set_pos (App(find g env, List.map (fun x -> find x env) xs))
  | ExtArray(x) -> set_pos (ExtArray(x))
  | ExtFunApp(x, ys) -> set_pos (ExtFunApp(x, List.map (fun y -> find y env) ys))

let f = g M.empty

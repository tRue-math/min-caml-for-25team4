open KNormal

let rec find ({v=_;pos}as e) env =
  try {v=Var(KMap.find e env);pos} with Not_found -> g env e
and 
  g env {v=e;pos} =
  let set_pos e = {v=e;pos} in
  let find_with_check e env = if Effect.check e then e else find e env  in 
  match e with
  | Unit -> set_pos Unit
  | Int(i) -> set_pos (Int(i))
  | Float(d) -> set_pos (Float(d))
  | Neg(x) -> set_pos (Neg(x))
  | Add(x, y) -> set_pos (Add(x, y))
  | Sub(x, y) -> set_pos (Sub(x, y))
  | FNeg(x) -> set_pos (FNeg(x))
  | FAdd(x, y) -> set_pos (FAdd(x, y))
  | FSub(x, y) -> set_pos (FSub(x, y))
  | FMul(x, y) -> set_pos (FMul(x, y))
  | FDiv(x, y) -> set_pos (FDiv(x, y))
  | IfEq(x, y, e1, e2) -> set_pos (IfEq(x, y, find_with_check e1 env, find_with_check e2 env))
  | IfLE(x, y, e1, e2) -> set_pos (IfLE(x, y, find_with_check e1 env, find_with_check e2 env))
  | Let((x, t), e1, e2) ->
      let e1' = find_with_check e1 env in
      set_pos (Let((x, t), e1', g (KMap.add e1' x env) e2))
  | Var(x) -> set_pos (Var(x))
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
      let e1' = find_with_check e1 env in
      set_pos (LetRec({ name = (x, t);
               args = yts;
               body = e1' },
             g (KMap.add e1' x env) e2))
  | App(x, ys) -> set_pos (App(x, ys))
  | Tuple(xs) -> set_pos (Tuple(xs))
  | LetTuple(xts, y, e) -> set_pos (LetTuple(xts, y, g env e))
  | Get(x, y) -> set_pos (Get(x, y))
  | Put(x, y, z) -> set_pos (Put(x, y, z))
  | ExtArray(x) -> set_pos (ExtArray(x))
  | ExtFunApp(x, ys) -> set_pos (ExtFunApp(x, ys))

let f = g KMap.empty
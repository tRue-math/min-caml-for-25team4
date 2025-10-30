open KNormal

let rec check {v=e;_} = match e with
  | Unit | Int(_) | Float(_) | Neg(_) | Add(_, _) | Sub(_, _)
  | FNeg(_) | FAdd(_, _) | FSub(_, _) | FMul(_, _) | FDiv(_, _)
  | Var(_) | Tuple(_) -> false
  | LetTuple(_, _, e) -> check e
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | Let(_, e1, e2)
  | LetRec({ name = _; args = _; body = e1 }, e2) -> check e1 || check e2
  | App(_, _) | Get(_, _) | Put(_, _, _) | ExtArray(_) | ExtFunApp(_, _) -> true
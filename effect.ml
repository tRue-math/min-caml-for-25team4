open KNormal

let rec g env {v=e;_} = match e with
  | LetTuple(_, _, e) -> g env e
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2) | Let(_, e1, e2) ->
    g env e1 && g env e2
  | LetRec({ name = (f,_); args = _; body = e1 }, e2) ->
    if g (f::env) e1 then g (f::env) e2 else false
  | App(f, _) -> (List.mem f env)
  | Get(_, _) | Put(_, _, _) | ExtArray(_) | ExtFunApp(_, _) -> false
  | _ -> true

let pure = g []
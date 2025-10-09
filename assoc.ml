(* flatten let-bindings (just for prettier printing) *)

open KNormal

let rec f {v=e;pos} = (* ネストしたletの簡約 (caml2html: assoc_f) *)
  let set_pos e = {v=e;pos} in match e with
  | IfEq(x, y, e1, e2) -> set_pos (IfEq(x, y, f e1, f e2))
  | IfLE(x, y, e1, e2) -> set_pos (IfLE(x, y, f e1, f e2))
  | Let(xt, e1, e2) -> (* letの場合 (caml2html: assoc_let) *)
      let rec insert {v=e;_} = match e with 
        | Let(yt, e3, e4) -> set_pos (Let(yt, e3, insert e4))
        | LetRec(fundefs, e) -> set_pos (LetRec(fundefs, insert e))
        | LetTuple(yts, z, e) -> set_pos (LetTuple(yts, z, insert e))
        | e -> set_pos (Let(xt, set_pos e, f e2)) in
      insert (f e1)
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
      set_pos (LetRec({ name = xt; args = yts; body = f e1 }, f e2))
  | LetTuple(xts, y, e) -> set_pos (LetTuple(xts, y, f e))
  | e -> set_pos e

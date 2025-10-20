open KNormal

let memi x env =
  try (match M.find x env with {v=Int(_);_} -> true | _ -> false)
  with Not_found -> false
let memf x env =
  try (match M.find x env with {v=Float(_);_} -> true | _ -> false)
  with Not_found -> false
let memt x env =
  try (match M.find x env with {v=Tuple(_);_} -> true | _ -> false)
  with Not_found -> false

let findi x env = (match M.find x env with {v=Int(i);_} -> i | _ -> raise Not_found)
let findf x env = (match M.find x env with {v=Float(d);_} -> d | _ -> raise Not_found)
let findt x env = (match M.find x env with {v=Tuple(ys);_} -> ys | _ -> raise Not_found)

let rec g env {v=e;pos} = (* 定数畳み込みルーチン本体 (caml2html: constfold_g) *)
  let set_pos e = {v=e;pos} in match e with
  | Var(x) when memi x env -> set_pos (Int(findi x env))
  (* | Var(x) when memf x env -> Float(findf x env) *)
  (* | Var(x) when memt x env -> Tuple(findt x env) *)
  | Neg(x) when memi x env -> set_pos (Int(-(findi x env)))
  | Add(x, y) when memi x env && memi y env -> set_pos (Int(findi x env + findi y env)) (* 足し算のケース (caml2html: constfold_add) *)
  | Sub(x, y) when memi x env && memi y env -> set_pos (Int(findi x env - findi y env))
  | FNeg(x) when memf x env -> set_pos (Float(-.(findf x env)))
  | FAdd(x, y) when memf x env && memf y env -> set_pos (Float(findf x env +. findf y env))
  | FSub(x, y) when memf x env && memf y env -> set_pos (Float(findf x env -. findf y env))
  | FMul(x, y) when memf x env && memf y env -> set_pos (Float(findf x env *. findf y env))
  | FDiv(x, y) when memf x env && memf y env -> set_pos (Float(findf x env /. findf y env))
  | IfEq(x, y, e1, e2) when memi x env && memi y env -> if findi x env = findi y env then g env e1 else g env e2
  | IfEq(x, y, e1, e2) when memf x env && memf y env -> if findf x env = findf y env then g env e1 else g env e2
  | IfEq(x, y, e1, e2) -> set_pos (IfEq(x, y, g env e1, g env e2))
  | IfLE(x, y, e1, e2) when memi x env && memi y env -> if findi x env <= findi y env then g env e1 else g env e2
  | IfLE(x, y, e1, e2) when memf x env && memf y env -> if findf x env <= findf y env then g env e1 else g env e2
  | IfLE(x, y, e1, e2) -> set_pos (IfLE(x, y, g env e1, g env e2))
  | Let((x, t), e1, e2) -> (* letのケース (caml2html: constfold_let) *)
      let e1' = g env e1 in
      let e2' = g (M.add x e1' env) e2 in
      set_pos (Let((x, t), e1', e2'))
  | LetRec({ name = x; args = ys; body = e1 }, e2) ->
      set_pos (LetRec({ name = x; args = ys; body = g env e1 }, g env e2))
  | LetTuple(xts, y, e) when memt y env ->
      List.fold_left2
        (fun e' xt z -> set_pos (Let(xt, set_pos (Var(z)), e')))
        (g env e)
        xts
        (findt y env)
  | LetTuple(xts, y, e) -> set_pos (LetTuple(xts, y, g env e))
  | e -> set_pos e

let f = g M.empty

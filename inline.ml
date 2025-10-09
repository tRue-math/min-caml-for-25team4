open KNormal

(* インライン展開する関数の最大サイズ (caml2html: inline_threshold) *)
let threshold = ref 0 (* Mainで-inlineオプションによりセットされる *)

let rec size {v=e;_} = match e with
  | IfEq(_, _, e1, e2) | IfLE(_, _, e1, e2)
  | Let(_, e1, e2) | LetRec({ body = e1;_ }, e2) -> 1 + size e1 + size e2
  | LetTuple(_, _, e) -> 1 + size e
  | _ -> 1

let rec g env {v=e;pos} = (* インライン展開ルーチン本体 (caml2html: inline_g) *)
  let set_pos e = {v=e;pos} in match e with
  | IfEq(x, y, e1, e2) -> set_pos (IfEq(x, y, g env e1, g env e2))
  | IfLE(x, y, e1, e2) -> set_pos (IfLE(x, y, g env e1, g env e2))
  | Let(xt, e1, e2) -> set_pos (Let(xt, g env e1, g env e2))
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) -> (* 関数定義の場合 (caml2html: inline_letrec) *)
      let env = if size e1 > !threshold then env else M.add x (yts, e1) env in
      set_pos (LetRec({ name = (x, t); args = yts; body = g env e1}, g env e2))
  | App(x, ys) when M.mem x env -> (* 関数適用の場合 (caml2html: inline_app) *)
      let (zs, e) = M.find x env in
      Format.eprintf "inlining %s@." x;
      let env' =
        List.fold_left2
          (fun env' (z, _) y -> M.add z y env')
          M.empty
          zs
          ys in
      Alpha.g env' e
  | LetTuple(xts, y, e) -> set_pos (LetTuple(xts, y, g env e))
  | e -> set_pos e

let f e = g M.empty e

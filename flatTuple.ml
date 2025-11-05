open KNormal

let rec flat_type = function
  | Type.Tuple ts ->
      List.flatten (List.map flat_type ts)
  | t -> [t]

let flat_xts =
  List.concat_map
  (fun (x,t) ->
    let flat_t = flat_type t in
    match flat_t with
    | [t] -> [(x,t)]
    | ts -> List.map (fun t -> (Id.genid x,t)) ts)

let rec reTuple xts flatten_xts set_pos g env e =
  match xts with
  | [] -> g env e
  | (x,t)::rest ->
    let rec split counter xts acc =
      match counter,xts with
      | [],_ -> (acc,xts)
      | _::c',(x,_)::flatten_xts -> split c' flatten_xts (acc@[x])
      | _ -> failwith "spliterror"
    in
    let flat_t = flat_type t in
    let (head_flatten_xs,flatten_xts_rest) = split flat_t flatten_xts [] in
    if List.length head_flatten_xs = 1 then
      reTuple rest flatten_xts_rest set_pos g env e
    else
      set_pos (Let((x, Type.Tuple(flat_t)),
      set_pos (Tuple(head_flatten_xs)),
      reTuple rest flatten_xts_rest set_pos g (M.add x head_flatten_xs env) e))

let rec g env {v=e;pos} =
  let set_pos e = {v=e;pos} in match e with
  | Tuple(xs) ->
    let flat_xs =
      List.concat_map (fun x -> if M.mem x env then M.find x env else [x]) xs in
    set_pos (Tuple(flat_xs))
  | App(x, ys) ->
    let flat_ys =
      List.concat_map (fun y -> if M.mem y env then M.find y env else [y]) ys in
    set_pos (App(x, flat_ys))
  | Let((x,t), {v=Tuple(ys);pos}, e2) ->
    let flat_ys =
      List.concat_map (fun y -> if M.mem y env then M.find y env else [y]) ys in
    set_pos (Let((x,Type.Tuple(flat_type t)),
            {v=Tuple(flat_ys);pos},
            g (M.add x flat_ys env) e2))
  | Let((x,(Type.Tuple(_)as t)), e1, e2) ->
    let flat_t = flat_type t in
    let xts' = List.map (fun t -> (Id.genid x,t)) flat_t in
    let xs' = List.map fst xts' in
    set_pos (Let((x,Type.Tuple(flat_type t)),
            g env e1,
            set_pos (LetTuple(xts', x,g (M.add x xs' env) e2))))
  | IfEq(x, y, e1, e2) -> set_pos (IfEq(x, y, g env e1, g env e2))
  | IfLE(x, y, e1, e2) -> set_pos (IfLE(x, y, g env e1, g env e2))
  | Let((x,t), e1, e2) ->
    let t' = match t with Type.Tuple(_)as t -> Type.Tuple(flat_type t) | t -> t in
    set_pos (Let((x,t'), g env e1, g env e2))
  | LetTuple(xts, y, e) ->
    let xts' = flat_xts xts in
    set_pos (LetTuple(xts', y, reTuple xts xts' set_pos g env e))
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
    let t' = match t with Type.Tuple(_)as t -> Type.Tuple(flat_type t) | t -> t in
    let yts' = flat_xts yts in
    set_pos (LetRec({ name = (x, t'); args = yts';
    body = reTuple yts yts' set_pos g env e1}, g env e2))
  | e -> set_pos e

let f e = g M.empty e

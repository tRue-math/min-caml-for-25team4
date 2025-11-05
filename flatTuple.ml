open KNormal

let rec flat_type = function
  | Type.Tuple ts ->
      List.flatten (List.map flat_type ts)
  | t -> [t]

let rec g env {v=e;pos} =
  let set_pos e = {v=e;pos} in match e with
  | Let((x,t), {v=Tuple(ys);pos}, e2) ->
    let flat_ys =
      List.concat_map (fun y -> if M.mem y env then M.find y env else [y]) ys in
    set_pos (Let((x,Type.Tuple(flat_type t)),
            {v=Tuple(flat_ys);pos},
            g (M.add x flat_ys env) e2))
  | IfEq(x, y, e1, e2) -> set_pos (IfEq(x, y, g env e1, g env e2))
  | IfLE(x, y, e1, e2) -> set_pos (IfLE(x, y, g env e1, g env e2))
  | Let(xt, e1, e2) -> set_pos (Let(xt, g env e1, g env e2))
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) -> set_pos (LetRec({ name = (x, t); args = yts; body = g env e1}, g env e2))
  | LetTuple(xts, y, e) ->
    let xts' =
      List.concat_map
      (fun (x,t) ->
        let flat_t = flat_type t in
        match flat_t with
        | [t] -> [(x,t)]
        | ts -> List.map (fun t -> (Id.genid x,t)) ts)
      xts
    in
    let rec reTuple xts xts' =
      match xts with
      | [] -> g env e
      | (x,t)::rest ->
        let rec split counter xts acc =
          match counter,xts with 
          | [],_ -> (acc,xts)
          | _::c',(x,_)::xts' -> split c' xts' (acc@[x])
          | _ -> failwith "spliterror"
        in
        let flat_t = flat_type t in
        let (head_xs',xts'_rest) = split flat_t xts' [] in
        if List.length head_xs' = 1 then
          reTuple rest xts'_rest
        else
          set_pos (Let((x, Type.Tuple(flat_t)),
          {v=Tuple(head_xs'); pos},
          reTuple rest xts'_rest))
    in
    set_pos (LetTuple(xts', y, reTuple xts xts'))
  | e -> set_pos e

let f e = g M.empty e

module KMap =
  Map.Make
    (struct
      type t = KNormal.t
      let compare =
        let rec compare_tree ({v=x;_}:t) ({v=y;_}:t) = (match x,y with
          | KNormal.IfEq(cx1,cx2,x1,x2), KNormal.IfEq(cy1,cy2,y1,y2)
          | KNormal.IfLE(cx1,cx2,x1,x2), KNormal.IfLE(cy1,cy2,y1,y2) ->
            let c1 = compare cx1 cy1 in
            let c2 = compare cx2 cy2 in
            let c3 = compare_tree x1 y1 in
            let c4 = compare_tree x2 y2 in 
            if c1 <> 0 then c1 else if c2 <> 0 then c2 else if c3 <> 0 then c3 else c4
          | KNormal.Let(vx,x1,x2), KNormal.Let(vy,y1,y2) ->
            let c1 = compare vx vy in
            let c2 = compare_tree x1 y1 in
            let c3 = compare_tree x2 y2 in
            if c1 <> 0 then c1 else if c2 <> 0 then c2 else c3
          | KNormal.LetRec({name=nx;args=ax;body=bx},ex),
            KNormal.LetRec({name=ny;args=ay;body=by},ey) ->
            let c1 = compare nx ny in
            let c2 = compare ax ay in
            let c3 = compare_tree bx by in
            let c4 = compare_tree ex ey in
            if c1 <> 0 then c1 else if c2 <> 0 then c2 else if c3 <> 0 then c3 else c4
          | KNormal.LetTuple(vsx,vx,ex), KNormal.LetTuple(vsy,vy,ey) ->
            let c1 = compare vsx vsy in
            let c2 = compare vx vy in
            let c3 = compare_tree ex ey in
            if c1 <> 0 then c1 else if c2 <> 0 then c2 else c3
          | _ -> compare (Obj.magic x) (Obj.magic y)
        ) in compare_tree
    end)
include KMap

let add_list xys env = List.fold_left (fun env (x, y) -> add x y env) env xys
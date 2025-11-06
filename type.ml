type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

let gentyp () = Var(ref None) (* 新しい型変数を作る *)

let rec to_string = function
  | Unit -> "Unit"
  | Bool -> "Bool"
  | Int -> "Int"
  | Float -> "Float"
  | Fun(args, ret) ->
      let args_str = String.concat ", " (List.map to_string args) in
      Printf.sprintf "Fun([%s], %s)" args_str (to_string ret)
  | Tuple(ts) ->
      let ts_str = String.concat ", " (List.map to_string ts) in
      Printf.sprintf "Tuple([%s])" ts_str
  | Array(t) ->
      Printf.sprintf "Array(%s)" (to_string t)
  | Var({contents=None}) -> "Var(None)"
  | Var({contents=Some t}) ->
      Printf.sprintf "Var(Some(%s))" (to_string t)

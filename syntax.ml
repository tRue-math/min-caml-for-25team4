(* MinCamlの構文を表現するデータ型 (caml2html: syntax_t) *)
type t = {v: node;pos: Lexing.position}
and node =
  | Unit
  | Bool of bool
  | Int of int
  | Float of float
  | Not of t
  | Neg of t
  | Add of t * t
  | Sub of t * t
  | FNeg of t
  | FAdd of t * t
  | FSub of t * t
  | FMul of t * t
  | FDiv of t * t
  | Eq of t * t
  | LE of t * t
  | If of t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fundef * t
  | App of t * t list
  | Tuple of t list
  | LetTuple of (Id.t * Type.t) list * t * t
  | Array of t * t
  | Get of t * t
  | Put of t * t * t
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

let print_expr oc (e : t) =
  let rec to_string {v=e;_} = match e with
    | Unit -> "()"
    | Bool(b) -> Printf.sprintf "BOOL %b" b
    | Int(i) -> Printf.sprintf "INT %d" i
    | Float(d) -> Printf.sprintf "FLOAT %f" d
    | Not(e) -> Printf.sprintf "NOT %s" (to_string e)
    | Neg(e) -> Printf.sprintf "NEG %s" (to_string e)
    | Add(e1, e2) -> Printf.sprintf "ADD(%s, %s)" (to_string e1) (to_string e2)
    | Sub(e1, e2) -> Printf.sprintf "SUB(%s, %s)" (to_string e1) (to_string e2)
    | FNeg(e) -> Printf.sprintf "FNEG %s" (to_string e)
    | FAdd(e1, e2) -> Printf.sprintf "FADD(%s, %s)" (to_string e1) (to_string e2)
    | FSub(e1, e2) -> Printf.sprintf "FSUB(%s, %s)" (to_string e1) (to_string e2)
    | FMul(e1, e2) -> Printf.sprintf "FMUL(%s, %s)" (to_string e1) (to_string e2)
    | FDiv(e1, e2) -> Printf.sprintf "FDIV(%s, %s)" (to_string e1) (to_string e2)
    | Eq(e1, e2) -> Printf.sprintf "EQ(%s, %s)" (to_string e1) (to_string e2)
    | LE(e1, e2) -> Printf.sprintf "LE(%s, %s)" (to_string e1) (to_string e2)
    | If(e1, e2, e3) -> Printf.sprintf "IF(\n%s\n%s\n%s\n)" (to_string e1) (to_string e2) (to_string e3)
    | Let((x, _), e1, e2) -> Printf.sprintf "LET(\n%s\n%s\n%s)" x (to_string e1) (to_string e2)
    | Var(x) -> Printf.sprintf "VAR %s" x
    | LetRec({ name = (x, _); args = yts; body = e1 }, e2) ->
        let args_str = String.concat ", " (List.map (fun (y, _) -> y) yts) in
        Printf.sprintf "LETREC(FUN:{\n%s [%s] = %s}\n%s)" x args_str (to_string e1) (to_string e2)
    | App(e, es) ->
        let es_str = String.concat ", " (List.map to_string es) in
        Printf.sprintf "APP(%s, [%s])" (to_string e) es_str
    | Tuple(es) ->
        let es_str = String.concat ", " (List.map to_string es) in
        Printf.sprintf "Tuple([%s])" es_str
    | LetTuple(xts, e1, e2) ->
        let xts_str = String.concat ", " (List.map (fun (x, _) -> Printf.sprintf "(%s, %s)" x "TypeVar") xts) in
        Printf.sprintf "LetTuple([%s], %s, %s)" xts_str (to_string e1) (to_string e2)
    | Array(e1, e2) -> Printf.sprintf "Array(%s, %s)" (to_string e1) (to_string e2)
    | Get(e1, e2) -> Printf.sprintf "Get(%s, %s)" (to_string e1) (to_string e2)
    | Put(e1, e2, e3) -> Printf.sprintf "Put(%s, %s, %s)" (to_string e1) (to_string e2) (to_string e3)
  in
  Printf.fprintf oc "%s\n" (to_string e)
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
  let make_indent level = String.make (level) ' ' in
  let rec to_string {v=e;_} level =
    let indent = make_indent level in let nlev = level+1 in match e with
    | Unit -> indent ^ "()"
    | Bool(b) -> Printf.sprintf "%sBOOL %b" indent b
    | Int(i) -> Printf.sprintf "%sINT %d" indent i
    | Float(d) -> Printf.sprintf "%sFLOAT %f" indent d
    | Not(e) -> Printf.sprintf "%sNOT\n%s" indent (to_string e nlev)
    | Neg(e) -> Printf.sprintf "%sNEG\n%s" indent (to_string e nlev)
    | Add(e1, e2) -> Printf.sprintf "%sADD(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | Sub(e1, e2) -> Printf.sprintf "%sSUB(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | FNeg(e) -> Printf.sprintf "%sFNEG\n%s" indent (to_string e nlev)
    | FAdd(e1, e2) -> Printf.sprintf "%sFADD(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | FSub(e1, e2) -> Printf.sprintf "%sFSUB(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | FMul(e1, e2) -> Printf.sprintf "%sFMUL(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | FDiv(e1, e2) -> Printf.sprintf "%sFDIV(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | Eq(e1, e2) -> Printf.sprintf "%sEQ(\n%s,\n%s\n%s)" 
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | LE(e1, e2) -> Printf.sprintf "%sLE(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | If(e1, e2, e3) -> Printf.sprintf "%sIF(\n%s\n%s\n%s\n%s)"
                    indent
                    (to_string e1 nlev) (to_string e2 nlev) (to_string e3 nlev)
                    indent
    | Let((x, _), e1, e2) -> Printf.sprintf "%sLET(\n%s\n%s\n%s\n%s)"
                    indent
                    (make_indent nlev ^ x) (to_string e1 nlev) (to_string e2 nlev)
                    indent
    | Var(x) -> Printf.sprintf "%sVAR %s" indent x
    | LetRec({ name = (x, _); args = yts; body = e1 }, e2) ->
        let args_str = String.concat ", " (List.map (fun (y, _) -> y) yts) in
        Printf.sprintf "%sLETREC(\n%s%s [%s] = {\n%s\n%s}\n%s\n%s)"
                    indent
                    (make_indent nlev) x args_str
                    (to_string e1 (level+2))
                    (make_indent nlev)
                    (to_string e2 nlev)
                    indent
    | App(e, es) ->
        let es_str = String.concat ",\n" 
            (List.map (fun e -> to_string e (level+2)) es) in
        Printf.sprintf "%sAPP(\n%s [\n%s\n%s]\n%s)"
                    indent (to_string e nlev)
                    es_str (make_indent nlev) indent
    | Tuple(es) ->
        let es_str = String.concat ",\n"
            (List.map (fun e -> to_string e nlev) es) in
        Printf.sprintf "%sTuple([\n%s\n%s])" indent es_str indent
    | LetTuple(xts, e1, e2) ->
        let xts_str = String.concat ", " (List.map (fun (x, _) -> x) xts) in
        Printf.sprintf "%sLetTuple(\n%s[%s],\n%s,\n%s\n%s)"
                    indent
                    (make_indent nlev) xts_str
                    (to_string e1 nlev) (to_string e2 nlev)
                    indent
    | Array(e1, e2) -> Printf.sprintf "%sArray(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | Get(e1, e2) -> Printf.sprintf "%sGet(\n%s,\n%s\n%s)"
                    indent (to_string e1 nlev) (to_string e2 nlev) indent
    | Put(e1, e2, e3) -> Printf.sprintf "%sPut(\n%s,\n%s,\n%s\n%s)"
                    indent
                    (to_string e1 nlev) (to_string e2 nlev) (to_string e3 nlev)
                    indent
  in
  Printf.fprintf oc "%s\n" (to_string e 0)
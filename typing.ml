(* type inference/reconstruction *)

open Syntax

exception Unify of Type.t * Type.t

let type_error_with_pos pos =
    failwith 
        (Printf.sprintf "type error line %d, near characters %d"
        pos.Lexing.pos_lnum (pos.Lexing.pos_cnum - pos.Lexing.pos_bol))

let extenv = ref M.empty

(* for pretty printing (and type normalization) *)
let rec deref_typ = function (* 型変数を中身でおきかえる関数 (caml2html: typing_deref) *)
  | Type.Fun(t1s, t2) -> Type.Fun(List.map deref_typ t1s, deref_typ t2)
  | Type.Tuple(ts) -> Type.Tuple(List.map deref_typ ts)
  | Type.Array(t) -> Type.Array(deref_typ t)
  | Type.Var({ contents = None } as r) ->
      Format.eprintf "uninstantiated type variable detected; assuming int@.";
      r := Some(Type.Int);
      Type.Int
  | Type.Var({ contents = Some(t) } as r) ->
      let t' = deref_typ t in
      r := Some(t');
      t'
  | t -> t
let deref_id_typ (x, t) = (x, deref_typ t)
let rec deref_term {v=e;pos} = 
    let set_pos e = { v = e; pos } in match e with
  | Not(e) -> set_pos (Not(deref_term e))
  | Neg(e) -> set_pos (Neg(deref_term e))
  | Add(e1, e2) -> set_pos (Add(deref_term e1, deref_term e2))
  | Sub(e1, e2) -> set_pos (Sub(deref_term e1, deref_term e2))
  | Eq(e1, e2) -> set_pos (Eq(deref_term e1, deref_term e2))
  | LE(e1, e2) -> set_pos (LE(deref_term e1, deref_term e2))
  | FNeg(e) -> set_pos (FNeg(deref_term e))
  | FAdd(e1, e2) -> set_pos (FAdd(deref_term e1, deref_term e2))
  | FSub(e1, e2) -> set_pos (FSub(deref_term e1, deref_term e2))
  | FMul(e1, e2) -> set_pos (FMul(deref_term e1, deref_term e2))
  | FDiv(e1, e2) -> set_pos (FDiv(deref_term e1, deref_term e2))
  | If(e1, e2, e3) -> set_pos (If(deref_term e1, deref_term e2, deref_term e3))
  | Let(xt, e1, e2) -> set_pos (Let(deref_id_typ xt, deref_term e1, deref_term e2))
  | LetRec({ name = xt; args = yts; body = e1 }, e2) ->
      set_pos (LetRec({ name = deref_id_typ xt;
               args = List.map deref_id_typ yts;
               body = deref_term e1 },
             deref_term e2))
  | App(e, es) -> set_pos (App(deref_term e, List.map deref_term es))
  | Tuple(es) -> set_pos (Tuple(List.map deref_term es))
  | LetTuple(xts, e1, e2) -> set_pos (LetTuple(List.map deref_id_typ xts, deref_term e1, deref_term e2))
  | Array(e1, e2) -> set_pos (Array(deref_term e1, deref_term e2))
  | Get(e1, e2) -> set_pos (Get(deref_term e1, deref_term e2))
  | Put(e1, e2, e3) -> set_pos (Put(deref_term e1, deref_term e2, deref_term e3))
  | e -> set_pos e

let rec occur r1 = function (* occur check (caml2html: typing_occur) *)
  | Type.Fun(t2s, t2) -> List.exists (occur r1) t2s || occur r1 t2
  | Type.Tuple(t2s) -> List.exists (occur r1) t2s
  | Type.Array(t2) -> occur r1 t2
  | Type.Var(r2) when r1 == r2 -> true
  | Type.Var({ contents = None }) -> false
  | Type.Var({ contents = Some(t2) }) -> occur r1 t2
  | _ -> false

let rec unify t1 t2 = (* 型が合うように、型変数への代入をする (caml2html: typing_unify) *)
  match t1, t2 with
  | Type.Unit, Type.Unit | Type.Bool, Type.Bool | Type.Int, Type.Int | Type.Float, Type.Float -> ()
  | Type.Fun(t1s, t1'), Type.Fun(t2s, t2') ->
      (try List.iter2 unify t1s t2s
      with Invalid_argument(_) -> raise (Unify(t1, t2)));
      unify t1' t2'
  | Type.Tuple(t1s), Type.Tuple(t2s) ->
      (try List.iter2 unify t1s t2s
      with Invalid_argument(_) -> raise (Unify(t1, t2)))
  | Type.Array(t1), Type.Array(t2) -> unify t1 t2
  | Type.Var(r1), Type.Var(r2) when r1 == r2 -> ()
  | Type.Var({ contents = Some(t1') }), _ -> unify t1' t2
  | _, Type.Var({ contents = Some(t2') }) -> unify t1 t2'
  | Type.Var({ contents = None } as r1), _ -> (* 一方が未定義の型変数の場合 (caml2html: typing_undef) *)
      if occur r1 t2 then raise (Unify(t1, t2));
      r1 := Some(t2)
  | _, Type.Var({ contents = None } as r2) ->
      if occur r2 t1 then raise (Unify(t1, t2));
      r2 := Some(t1)
  | _, _ -> raise (Unify(t1, t2))

let unify_with_pos t1 t2 pos =
  try unify t1 t2 with Unify _ -> type_error_with_pos pos

let rec g env {v=e;pos} = (* 型推論ルーチン (caml2html: typing_g) *)
  match e with
  | Unit -> Type.Unit
  | Bool(_) -> Type.Bool
  | Int(_) -> Type.Int
  | Float(_) -> Type.Float
  | Not(e) -> unify_with_pos Type.Bool (g env e) pos; Type.Bool
  | Neg(e) -> unify_with_pos Type.Int (g env e) pos; Type.Int
  | Add(e1, e2) | Sub(e1, e2) -> (* 足し算（と引き算）の型推論 (caml2html: typing_add) *)
      unify_with_pos Type.Int (g env e1) pos;
      unify_with_pos Type.Int (g env e2) pos;
      Type.Int
  | FNeg(e) -> unify_with_pos Type.Float (g env e) pos; Type.Float
  | FAdd(e1, e2) | FSub(e1, e2) | FMul(e1, e2) | FDiv(e1, e2) ->
      unify_with_pos Type.Float (g env e1) pos;
      unify_with_pos Type.Float (g env e2) pos;
      Type.Float
  | Eq(e1, e2) | LE(e1, e2) ->
      unify_with_pos (g env e1) (g env e2) pos; Type.Bool
  | If(e1, e2, e3) ->
      unify_with_pos Type.Bool (g env e1) pos;
      let t2 = g env e2 in
      let t3 = g env e3 in
      unify_with_pos t2 t3 pos;
      t2
  | Let((x, t), e1, e2) -> (* letの型推論 (caml2html: typing_let) *)
      unify_with_pos t (g env e1) pos;
      g (M.add x t env) e2
  | Var(x) when M.mem x env -> M.find x env (* 変数の型推論 (caml2html: typing_var) *)
  | Var(x) when M.mem x !extenv -> M.find x !extenv
  | Var(x) -> (* 外部変数の型推論 (caml2html: typing_extvar) *)
      Format.eprintf "free variable %s assumed as external@." x;
      let t = Type.gentyp () in
      extenv := M.add x t !extenv;
      t
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) -> (* let recの型推論 (caml2html: typing_letrec) *)
      let env = M.add x t env in
      unify_with_pos t (Type.Fun(List.map snd yts, g (M.add_list yts env) e1)) pos;
      g env e2
  | App(e, es) -> (* 関数適用の型推論 (caml2html: typing_app) *)
      let t = Type.gentyp () in
      unify_with_pos (g env e) (Type.Fun(List.map (g env) es, t)) pos;
      t
  | Tuple(es) -> Type.Tuple(List.map (g env) es)
  | LetTuple(xts, e1, e2) ->
      unify_with_pos (Type.Tuple(List.map snd xts)) (g env e1) pos;
      g (M.add_list xts env) e2
  | Array(e1, e2) -> (* must be a primitive for "polymorphic" typing *)
      unify_with_pos Type.Int (g env e1) pos;
      Type.Array(g env e2)
  | Get(e1, e2) ->
      let t = Type.gentyp () in
      unify_with_pos (Type.Array(t)) (g env e1) pos;
      unify_with_pos Type.Int (g env e2) pos;
      t
  | Put(e1, e2, e3) ->
      let t = g env e3 in
      unify_with_pos (Type.Array(t)) (g env e1) pos;
      unify_with_pos Type.Int (g env e2) pos;
      Type.Unit

let f e =
  extenv := M.empty;
(*
  (match deref_typ (g M.empty e) with
  | Type.Unit -> ()
  | _ -> Format.eprintf "warning: final result does not have type unit@.");
*)
  (try unify Type.Unit (g M.empty e)
  with Unify _ -> failwith "top level does not have type unit");
  extenv := M.map deref_typ !extenv;
  deref_term e

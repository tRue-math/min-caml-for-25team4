let limit = ref 1000

let rec iter n e = (* 最適化処理をくりかえす (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = Elim.f (ConstFold.f (Inline.f (Assoc.f (Beta.f e)))) in
  if e = e' then e else
  iter (n - 1) e'

let lexbuf parsedchan kchan achan beforeCSEchan afterCSEchan outchan l = (* バッファをコンパイルしてチャンネルへ出力する (caml2html: main_lexbuf) *)
  Id.counter := 0;
  Typing.extenv := M.empty;
  let parsed = MyParser.exp MyLexer.token l in
  Syntax.print_expr parsedchan parsed;
  let knormal = KNormal.f (Typing.f parsed) in
  KNormal.print_expr kchan knormal;
  KNormal.print_expr beforeCSEchan knormal;
  let cse = Cse.f knormal in
  KNormal.print_expr afterCSEchan cse;
  let alpha = Alpha.f knormal in
  KNormal.print_expr achan alpha;
  Emit.f outchan
    (RegAlloc.f
       (Simm.f
          (Virtual.f
             (Closure.f
                (iter !limit alpha)))))

let string s = lexbuf stdout stdout stdout stdout stdout stdout (Lexing.from_string s) (* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)

let file f = (* ファイルをコンパイルしてファイルに出力する (caml2html: main_file) *)
  let inchan = open_in (f ^ ".ml") in
  let outchan = open_out (f ^ ".s") in
  let parsedchan = open_out (f ^ ".parsed") in
  let kchan = open_out (f ^ ".normalized") in
  let achan = open_out (f ^ ".alpha") in
  let beforeCSEchan = open_out (f ^ ".before_CSE") in
  let afterCSEchan = open_out (f ^ ".after_CSE") in
  try
    lexbuf parsedchan kchan achan beforeCSEchan afterCSEchan outchan (Lexing.from_channel inchan);
    close_in inchan;
    close_out outchan;
    close_out parsedchan;
    close_out kchan;
  with e -> (close_in inchan; close_out outchan; close_out parsedchan; close_out kchan; raise e)

let () = (* ここからコンパイラの実行が開始される (caml2html: main_entry) *)
  let files = ref [] in
  Arg.parse
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files

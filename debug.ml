let print_debug filename print_func obj =
  let chan = open_out filename in
  print_func chan obj;
  close_out chan
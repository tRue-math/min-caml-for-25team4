let a = Array.make 2 0 in
a.(1) <- 1;
let x = a.(0) in
let y = a.(1) in
print_int x; print_int y; print_newline ()
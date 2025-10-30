let a = make 1 0 in
let b = if a.(0) = 0 then a.(0)<-1;0 else 1 in
let c = if a.(0) = 0 then a.(0)<-1;0 else 1 in
print_int b;print_int c
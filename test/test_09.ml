let a = (1,2) in
let b = (a,3) in
let c = (b,4) in
let (z,w) = c in
let (y,z) = z in
let (x,y) = y in
print_int x; print_int y; print_int z; print_int w
let rec g x y = (x,y) in
let rec f x y z = (x,g y z) in
let a = (2,3) in
let b = f 1 a 4 in
let (x,yzw)=b in
let (yz,w)=yzw in
let (y,z)=yz in
print_int (x+y+z+w)
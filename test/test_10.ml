let rec f x y z = (x,y,z) in
let a = (2,3) in
let b = f 1 a 4 in
let (x,yz,w)=b in
let (y,z)=yz in
print_int (x+y+z+w)
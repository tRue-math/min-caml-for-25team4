let rec f x y =
  let rec g a b =(y, (a,b)) in
  (x, g) in
let a = f (0,1) 2 in
let (ux,g)=a in
let (u,x)=ux in
let yzw = g 3 4 in
let (y,zw)=yzw in
let (z,w)=zw in
print_int (u+x+y+z)
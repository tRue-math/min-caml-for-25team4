let rec f x =
  let rec g y = x + y in
  g x
in
print_int (f 10)
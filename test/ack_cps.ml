let rec ack x y k =
  if x <= 0 then k (y + 1) else
  if y <= 0 then ack (x - 1) 1 k else
  ack x (y - 1) (fun v -> ack (x - 1) v k) in
print_int (ack 3 10 (fun r -> r))
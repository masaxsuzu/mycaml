type node =
  | Int of int
  | Add of node * node
  | Sub of node * node
  | Mul of node * node
  | Div of node * node

type token =
  | NUM of (int)
  | PLUS
  | MINUS
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.node

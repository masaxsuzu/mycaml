type token =
  | NUM of (int)
  | PLUS
  | MINUS
  | Asterisk
  | Slash
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.node

{
    open Lexing
    open Yacc_parse
}

let digit = ['0'-'9']

rule lex = parse
    | [' ' '\t' '\n'] { lex lexbuf }
    | "+" { PLUS }
    | "-" { MINUS }
    | "*" { Asterisk }
    | "/" { Slash }
    | "(" { LParen }
    | ")" { RParen }
    | digit+ { NUM(int_of_string (Lexing.lexeme lexbuf)) }
    | eof { EOF }

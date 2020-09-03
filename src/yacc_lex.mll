{
    open Yacc_parse
}

rule lex = parse
    | [' ' '\t' '\n'] { lex lexbuf }
    | "+" { PLUS }
    | "-" { MINUS }
    | ['0'-'9']+ as s { NUM(int_of_string s) }
    | eof { EOF }
%{
    (* Any OCaml Code *)
    open Ast
%}

%token <int> NUM
%token PLUS MINUS Asterisk Slash
%token EOF

%start program
%type <Ast.node> program

%%
expr :
    | NUM { Int($1) }
    | expr PLUS expr { Add($1, $3) }
    | expr MINUS expr { Sub($1, $3) }
    | expr Asterisk expr { Mul($1, $3) }
    | expr Slash expr { Div($1, $3) }

program :
    | expr EOF { $1 }

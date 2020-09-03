%{
    (* Any OCaml Code *)
    open Ast
%}

%token <int> NUM
%token PLUS MINUS EOF

%start program
%type <Ast.node> program

%%
expr :
    | NUM { Int($1) }
    | expr PLUS expr { Add($1, $3) }
    | expr MINUS expr { Sub($1, $3) }

program :
    | expr EOF { $1 }

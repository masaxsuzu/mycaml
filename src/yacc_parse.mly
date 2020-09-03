%{
    (* Any OCaml Code *)
%}

%token <int> NUM
%token PLUS MINUS EOF

%start program
%type <int> program

%%
expr :
    | NUM { $1 }
    | expr PLUS NUM { $1 + $3 }
    | expr MINUS NUM { $1 - $3 }

program :
    | expr EOF { $1 }

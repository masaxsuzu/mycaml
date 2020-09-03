
mycaml: yacc_lex.ml yacc_parse.ml yacc_parse.mli *.ml
	@ocamlc -c ast.ml yacc_parse.mli yacc_parse.ml yacc_lex.ml main.ml
	@ocamlc ast.ml yacc_parse.cmo yacc_lex.cmo main.cmo -o mycaml

yacc_lex.ml: yacc_lex.mll
	@ocamllex  yacc_lex.mll

yacc_parse.ml: yacc_parse.mly
	@ocamlyacc yacc_parse.mly

yacc_parse.mli: yacc_parse.ml

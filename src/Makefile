
mycaml: lexer.ml parser.ml parser.mli *.ml
	@ocamlc -c ast.ml parser.mli parser.ml lexer.ml main.ml
	@ocamlc ast.ml parser.cmo lexer.cmo main.cmo -o $@

lexer.ml: lexer.mll
	@ocamllex  lexer.mll

parser.ml: parser.mly
	@ocamlyacc parser.mly

parser.mli: parser.ml

clean:
	rm *.cmo *.cmi -f
	git ls-files --others | xargs rm -f

.PHONEY: clean

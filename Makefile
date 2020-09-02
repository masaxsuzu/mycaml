mycaml: src/*.ml
	@ocamlc src/main.ml -o mycaml

test: mycaml
	@bash ./test.sh

clean:
	rm src/*.cmo src/*.cmi mycaml tmp.* *.tmp

init:
	cp ./etc/config ./.git/config

.PHONEY: clean init test
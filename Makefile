mycaml: src/*.mly src/*.mll src/*.ml
	make -C src mycaml
	mv src/mycaml mycaml

test: mycaml
	@bash ./test.sh

fmt:
	ocamlformat -i src/*ml

clean:
	rm src/*.cmo src/*.cmi mycaml tmp.* *.tmp

init:
	cp ./etc/config ./.git/config
	opam install ocamlformat

.PHONEY: test clean init fmt
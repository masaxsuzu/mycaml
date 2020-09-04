all: fmt test

mycaml: src/*.mly src/*.mll src/*.ml
	make -C src $@
	mv src/$@ $@

test: mycaml
	@bash ./test.sh

fmt:
	ocamlformat -i src/*ml

clean:
	make -C src $@
	rm mycaml tmp.* *.tmp -f

init:
	opam install ocamlformat

.PHONEY: test clean init fmt 
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

dev:
	gcc --version
	opam --version
	opam show merlin -f version
	opam show ocaml-system -f version
	opam show ocamlformat -f version
	opam show user-setup -f version

.PHONEY: test fmt clean dev
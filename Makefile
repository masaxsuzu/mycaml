mycaml:
	@ocamlc src/main.ml -o mycaml

clean:
	rm src/*.cmo src/*.cmi mycaml

init:
	cp ./etc/config ./.git/config

.PHONEY: clean init
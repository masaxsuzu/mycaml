mycaml: src/*.mly src/*.mll src/*.ml
	make -C src mycaml
	mv src/mycaml mycaml

test: mycaml
	@bash ./test.sh

clean:
	rm src/*.cmo src/*.cmi mycaml tmp.* *.tmp

init:
	cp ./etc/config ./.git/config

.PHONEY: clean init test
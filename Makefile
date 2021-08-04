.PHONY: \
	check \
	clean \
	coverage \
	tests

check:
	shellcheck --shell=bash src/*

clean:
	rm --force --recursive coverage
	rm --force obtained.json

coverage:
	shellspec --kcov --kcov-options "--include-path=src" --shell bash tests

tests:
	tests/test_swapi.sh
	shellspec --shell bash tests

.PHONY: \
	check \
	clean \
	coverage \
	mutants \
	tests

check:
	shellcheck --shell=bash src/*

clean:
	rm --force --recursive coverage
	rm --force obtained.json

coverage:
	shellspec --kcov --kcov-options "--include-path=src" --shell bash tests

mutants:
	@echo "🏹😞 No mutation testing on Bash 👾🎉👾"

tests:
	tests/test_swapi.sh
	shellspec --shell bash tests

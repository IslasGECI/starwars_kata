.PHONY: \
	check \
	clean \
	coverage \
	mutants \
	tests \
	tests_api \
	tests_shell

check:
	shellcheck --shell=bash src/*

clean:
	rm --force --recursive coverage
	rm --force obtained.json

coverage:
	shellspec --kcov --kcov-options "--include-path=src" --shell bash tests

mutants:
	@echo "🏹😞 No mutation testing on Bash 👾🎉👾"

start:
	@echo "Stating API:"
	# Replace the command 'sleep 100' with the command that starts your API
	sleep 100

tests: tests_api tests_shell

tests_api:
	tests/test_swapi.sh

tests_shell:
	shellspec --shell bash tests

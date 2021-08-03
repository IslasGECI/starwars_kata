.PHONY: \
	clean \
	tests

clean:
	rm --force obtained.json

tests:
	tests/test_swapi.sh

#!/usr/bin/env bash
#
# Tests the SWAPI API

source src/helper.sh
export API_URL="https://swapi.dev/api/"

# Test the people endpoint
test_name="Person 1 is equal to expected person"
endpoint="people/1/"
expected_json="tests/expected-people.json"
if assert_equal "${endpoint}" "${expected_json}"
then
    echo "OK: ${test_name}"
else
    echo "FAIL: ${test_name}"
    exit 1
fi

test_name="Person 2 is valid"
endpoint="people/2/"
schema="tests/swapi-people-schema.json"
if validate_json "${endpoint}" "${schema}"
then
    echo "OK: ${test_name}"
else
    echo "FAIL: ${test_name}"
    exit 1
fi

# Test the planets endpoint
test_name="Planet 3 is equal to expected planet"
endpoint="planets/3/"
expected_json="tests/expected-planets.json"
if assert_equal "${endpoint}" "${expected_json}"
then
    echo "OK: ${test_name}"
else
    echo "FAIL: ${test_name}"
    exit 1
fi

test_name="Planet 2 is valid"
endpoint="planets/2/"
schema="tests/swapi-planets-schema.json"
if validate_json "${endpoint}" "${schema}"
then
    echo "OK: ${test_name}"
else
    echo "FAIL: ${test_name}"
    exit 1
fi

# Test the starships endpoint
test_name="Starship 9 is equal to expected starship"
endpoint="starships/9/"
expected_json="tests/expected-starships.json"
if assert_equal "${endpoint}" "${expected_json}"
then
    echo "OK: ${test_name}"
else
    echo "FAIL: ${test_name}"
    exit 1
fi

test_name="Starship 2 is valid"
endpoint="starships/2/"
schema="tests/swapi-starships-schema.json"
if validate_json "${endpoint}" "${schema}"
then
    echo "OK: ${test_name}"
else
    echo "FAIL: ${test_name}"
    exit 1
fi

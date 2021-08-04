#!/usr/bin/env bash
#
# Tests the SWAPI API

source src/helper.sh
export API_URL="https://swapi.dev/api/"

# Test the people endpoint
test_name="Person 1 is equal to expected person"
test_function="assert_equal"
endpoint="people/1/"
expected_json="tests/expected-people.json"
test_case "${test_name}" "${test_function}" "${endpoint}" "${expected_json}"

test_name="Person 2 is valid"
test_function="validate_json"
endpoint="people/2/"
schema="tests/swapi-people-schema.json"
test_case "${test_name}" "${test_function}" "${endpoint}" "${expected_json}"

# Test the planets endpoint
test_name="Planet 3 is equal to expected planet"
test_function="assert_equal"
endpoint="planets/3/"
expected_json="tests/expected-planets.json"
test_case "${test_name}" "${test_function}" "${endpoint}" "${expected_json}"

test_name="Planet 2 is valid"
test_function="validate_json"
endpoint="planets/2/"
schema="tests/swapi-planets-schema.json"
test_case "${test_name}" "${test_function}" "${endpoint}" "${expected_json}"

# Test the starships endpoint
test_name="Starship 9 is equal to expected starship"
test_function="assert_equal"
endpoint="starships/9/"
expected_json="tests/expected-starships.json"
test_case "${test_name}" "${test_function}" "${endpoint}" "${expected_json}"

test_name="Starship 2 is valid"
test_function="validate_json"
endpoint="starships/2/"
schema="tests/swapi-starships-schema.json"
test_case "${test_name}" "${test_function}" "${endpoint}" "${expected_json}"
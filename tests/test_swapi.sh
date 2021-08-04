#!/usr/bin/env bash
#
# Tests the SWAPI API

source src/helper.sh
export API_URL="https://swapi.dev/api/"

# Test the people endpoint
# Person 1 is equal to expected person
endpoint="people/1/"
expected_json="tests/expected-people.json"
assert_equal "${endpoint}" "${expected_json}"

# Person 2 is valid
endpoint="people/2/"
schema="tests/swapi-people-schema.json"
validate_json "${endpoint}" "${schema}"

# Test the planets endpoint
# Planet 3 is equal to expected planet
endpoint="planets/3/"
expected_json="tests/expected-planets.json"
assert_equal "${endpoint}" "${expected_json}"

# Planet 2 is valid
endpoint="planets/2/"
schema="tests/swapi-planets-schema.json"
validate_json "${endpoint}" "${schema}"


# Test the starships endpoint
# Starship 9 is equal to expected starship
endpoint="starships/9/"
expected_json="tests/expected-starships.json"
assert_equal "${endpoint}" "${expected_json}"

# Starship 2 is valid
endpoint="starships/2/"
schema="tests/swapi-starships-schema.json"
validate_json "${endpoint}" "${schema}"


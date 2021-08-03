#!/usr/bin/env bash
#
# Tests the SWAPI API

# Test the people endpoint
endpoint="people/1/"
curl https://swapi.dev/api/"${endpoint}" --output obtained.json
jq --argfile expected_response tests/expected-people.json --argfile obtained_response obtained.json -n '$expected_response == $obtained_response'
jsonschema --instance obtained.json tests/swapi-people-schema.json

# Test the planets endpoint
endpoint="planets/3/"
curl https://swapi.dev/api/"${endpoint}" --output obtained.json
jq --argfile expected_response tests/expected-planets.json --argfile obtained_response obtained.json -n '$expected_response == $obtained_response'
jsonschema --instance obtained.json tests/swapi-planets-schema.json

# Test the starships endpoint
endpoint="starships/9/"
curl https://swapi.dev/api/"${endpoint}" --output obtained.json
jq --argfile expected_response tests/expected-starships.json --argfile obtained_response obtained.json -n '$expected_response == $obtained_response'
jsonschema --instance obtained.json tests/swapi-starships-schema.json

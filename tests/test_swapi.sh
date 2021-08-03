#!/usr/bin/env bash
curl https://swapi.dev/api/people/1 --output obtained.json
jq --argfile expected_response tests/expected.json --argfile obtained_response obtained.json -n '$expected_response == $obtained_response'
jsonschema --instance obtained.json tests/swapi-people-schema.json

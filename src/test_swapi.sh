#!/usr/bin/env bash
curl https://swapi.dev/api/people/1 --output obtained.json
jq --argfile expected_response expected.json --argfile obtained_response obtained.json -n '$expected_response == $obtained_response'
jsonschema --instance obtained.json swapi-people-schema.json

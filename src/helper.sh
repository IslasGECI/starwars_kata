function assert_equal(){
    endpoint=$1
    expected_json=$2
    curl --output obtained.json --show-error --silent "${API_URL}${endpoint}"
    jq --argfile expected_response "${expected_json}" --argfile obtained_response obtained.json -n '$expected_response == $obtained_response' | grep "true"
}

function assert_not_equal(){
    endpoint=$1
    expected_json=$2
    curl --output obtained.json --show-error --silent "${API_URL}${endpoint}"
    jq --argfile expected_response "${expected_json}" --argfile obtained_response obtained.json -n '$expected_response != $obtained_response' | grep "true"
}

function validate_json(){
    endpoint=$1
    schema=$2
    curl --output obtained.json --show-error --silent "${API_URL}${endpoint}"
    jsonschema --instance obtained.json "${schema}"
}

function test_case(){
    test_name=$1
    test_function=$2
    shift 2
    if "${test_function}" "${@}"
    then
        echo "PASS: ${test_name}"
    else
        echo "FAIL: ${test_name}"
        exit 1
    fi
}

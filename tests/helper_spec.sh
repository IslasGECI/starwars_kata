Describe 'helper.sh'
  Include src/helper.sh

  Mock curl
    echo "curl $@"
  End

  Mock jq
    echo "true"
  End

  It 'assert_equal success'
    When call assert_equal a b
    The first line of output should eq "curl --output obtained.json --show-error --silent a"
    The status should be success
  End

  Mock jq
    echo "false"
  End

  It 'assert_equal failure'
    When call assert_equal a b
    The first line of output should eq "curl --output obtained.json --show-error --silent a"
    The status should be failure
  End

  Mock jsonschema
    echo "jsonschema $@"
  End

  It 'validate_json'
    When call validate_json a b
    The first line of output should eq "curl --output obtained.json --show-error --silent a"
    The second line of output should eq "jsonschema --instance obtained.json b"
    The status should be success
  End
End
# run with ./test.sh --tags wrong_usage
@wrong_usage
Feature: Wrong usage of llama.cpp server

  #3969 The user must always set --n-predict option
  # to cap the number of tokens any completion request can generate
  # or pass n_predict/max_tokens in the request.
  Scenario: Infinite loop
    Given a server listening on localhost:8080
    And   a model file stories260K.gguf
    # Uncomment below to fix the issue
    #And   64 server max tokens to predict
    Then  the server is starting
    Given a prompt:
      """
      Go to: infinite loop
      """
    # Uncomment below to fix the issue
    #And   128 max tokens to predict
    Given concurrent completion requests
    Then all prompts are predicted

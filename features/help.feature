Feature: Display the command line options as help
  Scenario: Requesting the help
    When I provide the option "--help
    Then I should get help on how to use the program

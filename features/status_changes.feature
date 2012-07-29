Feature: Changing status of todos
  Scenario: Delete a todo
    Given I added todos
    When I provide the option "-d" plus the hash of a todo
    Then this todo should be deleted

  Scenario: Start a todo
    Given I added todos
    When I provide the option "-s" plus the hash of a todo
    Then this todo should be marked current

  Scenario: Finish a todo
    Given I added todos
    When I provide the option "-f" plus the hash of a todo
    Then this todo should be marked finished

  Scenario: Finish a todo by partial hash
    Given I added todos
    When I provide the opion "-f" plus the partial hash of a todo
    Then this todo should be marked finished

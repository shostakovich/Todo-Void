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

  Scenario: Change status by partial hash
    Given I added todos
    When I provide the opion "-f" plus the partial hash of a todo
    Then this todo should be marked finished

  Scenario: Change status with conflicting partial hash
    Given I added todos
    When I provide the option "-f" and a conflicting partial hash
    Then I should be notified about a conflict
    And I should see the list of alternatives

 Scenario: Change status with a non-existent hash
    Given I added todos
    When I provide the option "-f" and a non-existent hash
    Then I should be notified about the erronious hash

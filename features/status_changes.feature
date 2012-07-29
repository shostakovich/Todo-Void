Feature: Changing status of tasks
  Scenario: Delete a task
    Given I added tasks
    When I provide the option "-d" plus the hash of a task
    Then this task should be deleted

  Scenario: Start a task
    Given I added tasks
    When I provide the option "-s" plus the hash of a task
    Then this task should be marked current

  Scenario: Finish a task
    Given I added tasks
    When I provide the option "-f" plus the hash of a task
    Then this task should be marked finished

  Scenario: Finish a task by partial hash
    Given I added tasks
    When I provide the opion "-f" plus the partial hash of a task
    Then this task should be marked finished

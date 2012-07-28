Feature: Changing status of tasks
  Scenario: Delete a task
    Given I added tasks
    When I provide the option "-d" plus the hash of a task
    Then this task should be deleted

  Scenario: Finish a task
    Given I added tasks
    When I provide the option "-f" plus the hash of a task
    Then this task should be marked finished

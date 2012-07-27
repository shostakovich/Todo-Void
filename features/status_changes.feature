Feature: Changing status of tasks
  Scenario: Delete a task
    Given An empty task list
      And I added tasks
    When I enter the hash of a task
    Then this task should be deleted

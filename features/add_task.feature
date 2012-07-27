Feature: Adding a task
  Scenario: Adding a task
    Given An empty task list
    When I add a task
    Then the task should appear in the list of tasks

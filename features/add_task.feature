Feature: Adding a task
  Scenario: Adding a task
    As one who has tasks
    Given An empty task list
    When I add a task
    Then the task should appear in the list of tasks

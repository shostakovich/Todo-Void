Feature: Listing tasks
  Scenario: Every task has a number
    Given An empty task list
      And I added tasks
    When I run the task command
    Then I should see a list of tasks
      And every task should have a unique number in front of it

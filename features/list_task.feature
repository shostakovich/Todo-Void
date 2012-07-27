Feature: Listing tasks
  Scenario: Every task has a number
    Given I added tasks
    When I run the task command
    Then I should see a list of tasks
      And every task should have a unique number in front of it

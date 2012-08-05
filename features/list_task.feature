Feature: Listing todos
  Scenario: Every todo has a unique id
    Given I added todos
    When I run the todo command
    Then I should see a list of todos
    And every todo should have a unique number in front of it

  Scenario: Finished tasks are hidden on the next day
    Given I added todos
    When I finish a todo
      And I run the command the next day
    Then I should see not see the finished todo

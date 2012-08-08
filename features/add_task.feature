Feature: Adding a todo
  Scenario: Adding a todo
    Given An empty todo list
    When I add a todo
    Then the todo should appear in the list of todos

  Scenario: Create a new todo under a tag
    Given An empty todo list
    When I add a todo with a tag
    Then the todo should appear in the list of todos
      And next to it I should see the tag

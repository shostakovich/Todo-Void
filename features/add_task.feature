Feature: Adding a todo
  Scenario: Adding a todo
    Given An empty todo list
    When I add a todo
    Then the todo should appear in the list of todos

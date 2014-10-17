@feature

Feature: Assigning of a todo to a person


  Scenario: I want to assign a person to a todo item

  Given I have a person "Husband A"
  And I have a todo item "Doing the dishes"
  When I go to "the todo list"
  And I assign the todo item "Doing the dishes" to person "Husband A"
  Then "Husband A" is assignee of the todo "Doing the dishes"

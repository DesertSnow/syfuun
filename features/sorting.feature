@feature

  Feature: I want to see my list of todos sorted

    Scenario: non prioritised todos are sorted by name alphabetically
      Given I have a list of todos with the following options:
          |     name       |
          |     Zo the dishes |
          |     Mow the lawn  |
          |     2do           |
      When I go to "the todo list"
      Then "the todos" should be sorted "alphabetically" as follows:
        |     name       |
        |     2do           |
        |     Mow the lawn  |
        |     Zo the dishes |
#    Then I should see "2do" within "the first todo item"



    Scenario: prioritised todos are shown first, listed alphabetically
      Given I have a list of todos with the following options:
        |     name       |
        |     Zo the dishes |
        |     Mow the lawn  |
        |     2do           |
        |     3D rendering  |
      When I prioritise the todo "3D rendering"
        And I prioritise the todo "Mow the lawn"
#      When I go to the todo list
#      Then "the todos" should be sorted "by priority alphabetically" as follows:
#        |     name       |
#        |     3D rendering  |
#        |     Mow the lawn  |
#        |     2do           |
#        |     Zo the dishes |






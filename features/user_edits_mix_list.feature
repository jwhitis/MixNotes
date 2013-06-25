Feature: User edits mix list
  In order to moderate page content
  As a user
  I want to edit my mix list

  Scenario: User deletes a mix
    Given I am signed in
    And I have the following mixes:
      | title         | artist        | admin          |
      | Higher Ground | Stevie Wonder | me@example.com |
    When I go to the homepage
    And I click "Delete"
    Then I should not see "Higher Ground"
    And I should not see "Stevie Wonder"

  Scenario: User leaves a mix
    Given user "bob@example.com" with password "password1"
    And user "bob@example.com" has the following mixes:
      | title           | artist        | admin           |
      | Go Your Own Way | Fleetwood Mac | bob@example.com |
    And I am signed in
    And I have access to mix "Go Your Own Way"
    When I go to the homepage
    And I click "Leave"
    Then I should not see "Go Your Own Way"
    And I should not see "Fleetwood Mac"
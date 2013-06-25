Feature: User leaves mix
  In order to modify my mix list
  As a user
  I want to leave a mix

  Scenario: User leaves a mix
    Given the user "bob@example.com" with password "password1"
    And user "bob@example.com" has the following mixes:
      | title           | artist        |
      | Go Your Own Way | Fleetwood Mac |
    And I am signed in
    And I have acces to mix "Go Your Own Way"
    When I go to the homepage
    And I click "Leave"
    Then I should not see "Go Your Own Way"
    And I should not see "Fleetwood Mac"
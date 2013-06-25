Feature: User views list of mixes
  In order to choose a mix to view
  As a user
  I want to view a list of mixes

  Scenario: Single user has several mixes
    Given I am signed in
    And I have the following mixes:
      | title             | artist            | admin          |
      | That Song         | Bouncing Souls    | me@example.com |
      | Nickels and Dimes | Social Distortion | me@example.com |
    When I go to the homepage
    Then I should see "That Song"
    And I should see "Bouncing Souls"
    And I should see "Nickels and Dimes"
    And I should see "Social Distortion"
    And I should see "me@example.com"

  Scenario: Several users have several mixes
    Given the user "bob@example.com" with password "password1"
    And user "bob@example.com" has the following mixes:
      | title    | artist         | admin           |
      | Debaser  | The Pixies     | bob@example.com |
      | Magazine | Pedro the Lion | bob@example.com |
    And I am signed in
    And I have the following mixes:
      | title      | artist          | admin          |
      | What I Got | Sublime         | me@example.com |
      | Jumper     | Third Eye Blind | me@example.com |
    When I go to the homepage
    Then I should see "What I Got"
    And I should see "Sublime"
    And I should see "Jumper"
    And I should see "Third Eye Blind"
    And I should see "me@example.com"
    And I should not see "Debaser"
    And I should not see "The Pixies"
    And I should not see "Magazine"
    And I should not see "Pedro the Lion"
    And I should not see "bob@example.com"
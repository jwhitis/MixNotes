Feature: User views list of mixes
  In order to choose a mix to view
  As a user
  I want to view a list of mixes

  Scenario: Single user has several mixes
    Given I am signed in
    And I have the following mixes:
      | title             | artist            |
      | That Song         | Bouncing Souls    |
      | Nickels and Dimes | Social Distortion |
    When I go to the homepage
    Then I should see "That Song"
    And I should see "Bouncing Souls"
    And I should see "Nickels and Dimes"
    And I should see "Social Distortion"

  Scenario: Several users have several mixes
    Given the user "bob@example.com" with password "password1"
    And user "bob@example.com" has the following mixes:
      | title    | artist         |
      | Debaser  | The Pixies     |
      | Magazine | Pedro the Lion |
    And I am signed in
    And I have the following mixes:
      | title      | artist          |
      | What I Got | Sublime         |
      | Jumper     | Third Eye Blind |
    When I go to the homepage
    Then I should see "What I Got"
    And I should see "Sublime"
    And I should see "Jumper"
    And I should see "Third Eye Blind"
    And I should not see "Debaser"
    And I should not see "The Pixies"
    And I should not see "Magazine"
    And I should not see "Pedro the Lion"
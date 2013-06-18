Feature: User views list of mixes
  In order to choose a single mix to view
  As a user
  I want to view a list of mixes

  Scenario: Several users have several mixes
    Given the user "bob@example.com" has the following mixes:
      | title              | artist     |
      | Debaser            | The Pixies |
      | Tame               | The Pixies |
      | Wave of Mutilation | The Pixies |
    And I am signed in
    And I have the following mixes:
      | title          | artist         |
      | That Song      | Bouncing Souls |
      | Private Radio  | Bouncing Souls |
      | True Believers | Bouncing Souls |
    When I go to the homepage
    Then I should see "That Song"
    And I should see "Private Radio"
    And I should see "True Believers"
    And I should not see "Debaser"
    And I should not see "Tame"
    And I should not see "Wave of Mutilation"
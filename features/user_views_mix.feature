Feature: User views mix
  In order to comment on a mix
  As a user
  I want to view a mix

  Scenario: User chooses a mix from a list
    Given I am signed in
    And I have the following mixes:
      | title          | artist       | admin          |
      | My Way         | Butch Walker | me@example.com |
      | Savory         | Jawbox       | me@example.com |
      | American Heart | Piebald      | me@example.com |
    When I go to the homepage
    And I click "My Way"
    Then I should see "My Way"
    And I should see "Butch Walker"
    And I should not see "Savory"
    And I should not see "Jawbox"
    And I should not see "American Heart"
    And I should not see "Piebald"
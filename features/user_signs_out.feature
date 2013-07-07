Feature: User signs out
  In order to protect my account
  As a user
  I want to sign out

  Scenario: User signs out
    Given I am signed in
    When I go to the homepage
    And I click "Sign Out"
    Then I should see "Sign in"
    And I should not see "Sign Out"
    And I should not see "me@example.com"
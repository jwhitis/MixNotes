Feature: User signs up
  In order to access the site
  As a user
  I want to sign up

  Scenario: User signs up
    When I go to the homepage
    And I click "Sign up"
    And I fill in "Email" with "bob@example.com"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password1"
    And I press "Sign up"
    Then I should see "You have signed up successfully."
    And I should see "bob@example.com"
    And I should see "Sign Out"
    And I should not see "Sign up"

  Scenario: User enters invalid email
    When I go to the homepage
    And I click "Sign up"
    And I fill in "Email" with "bob"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password1"
    And I press "Sign up"
    Then I should see "Email is invalid"
    And I should not see "Sign Out"

  Scenario: User enters password that doesn't match confirmation
    When I go to the homepage
    And I click "Sign up"
    And I fill in "Email" with "bob@example.com"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password2"
    And I press "Sign up"
    Then I should see "Password doesn't match confirmation"
    And I should not see "Sign Out"

  Scenario: User enters password that is too short
    When I go to the homepage
    And I click "Sign up"
    And I fill in "Email" with "bob@example.com"
    And I fill in "Password" with "pass"
    And I fill in "Password confirmation" with "pass"
    And I press "Sign up"
    Then I should see "Password is too short (minimum is 8 characters)"
    And I should not see "Sign Out"
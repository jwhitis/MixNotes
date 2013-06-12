@wip
Feature: User can log in and out
  In order to upload mixes
  As a user
  I want to log in

  Scenario: Best Case
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I click "Sign In"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I press "Sign In"
    Then I should see "You are now logged in."
    And I should not see "Sign In"

  Scenario: Wrong Username
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I click "Sign In"
    And I fill in "betty@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I press "Sign In"
    Then I should see "Your username or password is incorrect. Please try again."

  Scenario: Wrong Password
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I click "Sign In"
    And I fill in "bob@example.com" for "Email"
    And I fill in "wrong password" for "Password"
    And I press "Sign In"
    Then I should see "Your username or password is incorrect. Please try again."
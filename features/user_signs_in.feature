Feature: User signs in
  In order to upload mixes
  As a user
  I want to sign in

  Scenario: User signs in
    Given user "bob@example.com" with password "password1"
    When I go to the homepage
    And I fill in "Email" with "bob@example.com"
    And I fill in "Password" with "password1"
    And I press "Sign in"
    Then I should see "You are now signed in."
    And I should not see "Sign in"

  Scenario: User enters wrong username
    Given user "bob@example.com" with password "password1"
    When I go to the homepage
    And I fill in "Email" with "betty@example.com"
    And I fill in "Password" with "password1"
    And I press "Sign in"
    Then I should see "Your email or password is incorrect. Please try again."

  Scenario: User enters wrong password
    Given user "bob@example.com" with password "password1"
    When I go to the homepage
    And I fill in "Email" with "bob@example.com"
    And I fill in "Password" with "wrong password"
    And I press "Sign in"
    Then I should see "Your email or password is incorrect. Please try again."
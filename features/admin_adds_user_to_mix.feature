Feature: Admin adds user to mix
  In order to enable collaboration
  As an admin
  I want to add another user to a mix

  Scenario: Admin adds a registered user to a mix
    Given the user "bob@example.com" with password "password1"
    And I am signed in
    And I have the following mixes:
      | title             | artist  | admin          |
      | The Deadly Rhythm | Refused | me@example.com |
    When I view mix "The Deadly Rhythm"
    And I click "Add a user"
    And I fill in "Email" with "bob@example.com"
    And I click element "#new_permission input[type="submit"]"
    Then I should see "bob@example.com has been successfully added to this mix."
    And "bob@example.com" should be listed as a user

  Scenario: Admin tries to add an unregistered user
    Given I am signed in
    And I have the following mixes:
      | title      | artist          | admin          |
      | The Remedy | Abandoned Pools | me@example.com |
    When I view mix "The Remedy"
    And I click "Add a user"
    And I fill in "Email" with "bob@example.com"
    And I click element "#new_permission input[type="submit"]"
    Then I should see "bob@example.com is not a registered user."
    And "bob@example.com" should not be listed as a user
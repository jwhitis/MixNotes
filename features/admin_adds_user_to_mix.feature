Feature: Admin adds user to mix
  In order to enable collaboration
  As an admin
  I want to add another user to a mix

  Scenario: Admin adds a registered user to a mix
    Given the user "bob@example.com" with password "password1"
    And I am signed in
    And I have the following mixes:
      | title             | artist  |
      | The Deadly Rhythm | Refused |
    And I add user "bob@example.com" to mix "The Deadly Rhythm"
    When I view mix "The Deadly Rhythm"
    Then I should see "bob@example.com"

  Scenario: Admin tries to add an unregistered user
    Given I am signed in
    And I have the following mixes:
      | title      | artist          |
      | The Remedy | Abandoned Pools |
    And I add user "bob@example.com" to mix "The Remedy"
    When I view mix "The Remedy"
    Then I should not see "bob@example.com"
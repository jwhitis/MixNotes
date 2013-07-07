Feature: User views activity
  In order to see what changes have been made
  As a user
  I want to view all recent activity

  Scenario: User uploads a mix and posts a comment
    Given I am signed in
    And I have the following mixes:
      | title     | artist        | admin          |
      | Love Fool | The Cardigans | me@example.com |
    And I posted the following comments in mix "Love Fool":
      | time | content       |
      | 0    | Disco-tastic! |
    When I go to the activity page
    Then I should see "Uploaded "Love Fool""
    And I should see "Posted "Disco-tastic!" in "Love Fool""

  Scenario: Other user uploads a mix and posts a comment
    Given user "bob@example.com" with password "password1"
    And user "bob@example.com" has the following mixes:
      | title | artist  | admin           |
      | Drive | Incubus | bob@example.com |
    And I am signed in
    And I have access to mix "Drive"
    And user "bob@example.com" posted the following comments in mix "Drive":
      | time | content                                          |
      | 0    | It's like high school graduation all over again. |
    When I go to the activity page
    Then I should see "Joined "Drive""
    And I should see "Posted "It's like high school graduation all over again." in "Drive""
    And I should see "bob@example.com"
    And I should not see "Uploaded "Drive""

  Scenario: Other user posts a comment while user is signed out
    Given user "me@example.com" with password "password1"
    And I have the following mixes:
      | title         | artist         | admin          |
      | Barton Hollow | The Civil Wars | me@example.com |
    And user "bob@example.com" with password "password1"
    And user "bob@example.com" posted the following comments in mix "Barton Hollow":
      | time | content                        |
      | 0    | My girlfriend loves this song. |
    When I am signed in
    And I go to the activity page
    Then I should see "Posted "My girlfriend loves this song." in "Barton Hollow""
    And I should see "bob@example.com"
    And the notification count should be "2"
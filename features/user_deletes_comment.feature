Feature: User deletes comment
  In order to moderate page content
  As a user
  I want to delete a comment

  Scenario: User deletes a comment
    Given I am signed in
    And I have the following mixes:
      | title          | artist | admin          |
      | Some Might Say | Oasis  | me@example.com |
    And I posted the following comments in mix "Some Might Say":
      | time | content                                  |
      | 0    | I wish this record wasn't so compressed! |
    When I view mix "Some Might Say"
    And I click "Delete"
    Then I should not see "I wish this record wasn't so compressed!"

  Scenario: User deletes a comment with replies
    Given I am signed in
    And I have the following mixes:
      | title   | artist | admin          |
      | Emotion | MXPX   | me@example.com |
    And I posted the following comments in mix "Emotion":
      | time | content                     |
      | 0    | That's my middle name, too! |
    And comment "That's my middle name, too!" has the following replies:
      | content                    |
      | Your parents must be mean. |
    When I view mix "Emotion"
    And I click element ".comment-row .edit-comment"
    Then I should not see "That's my middle name, too!"
    And I should not see "Your parents must be mean."

  Scenario: Admin deletes a user comment
    Given I am signed in
    And I have the following mixes:
      | title    | artist        | admin          |
      | Sell Out | Reel Big Fish | me@example.com |
    And user "bob@example.com" with password "password1"
    And user "bob@example.com" has access to mix "Sell Out"
    And user "bob@example.com" posted the following comments in mix "Sell Out":
      | time | content                                    |
      | 0    | But I can't work in fast food all my life! |
    When I view mix "Sell Out"
    And I click element ".comment-row .edit-comment"
    Then I should not see "But I can't work in fast food all my life!"
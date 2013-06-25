Feature: User deletes comment
  In order to moderate page content
  As a user
  I want to delete a comment

  Scenario: User deletes a comment
    Given I am signed in
    And I have the following mixes:
      | title          | artist |
      | Some Might Say | Oasis  |
    And mix "Some Might Say" has the following comments:
      | time | content                                  |
      | 0    | I wish this record wasn't so compressed! |
    When I view mix "Some Might Say"
    And I click "Delete"
    Then I should not see "I wish this record wasn't so compressed!"

  Scenario: User deletes a comment with replies
    Given I am signed in
    And I have the following mixes:
      | title   | artist |
      | Emotion | MXPX   |
    And mix "Emotion" has the following comments:
      | time | content                     |
      | 0    | That's my middle name, too! |
    And comment "That's my middle name, too!" has the following replies:
      | content                    |
      | Your parents must be mean. |
    When I view mix "Emotion"
    And I click element ".comment-row .delete-comment"
    Then I should not see "That's my middle name, too!"
    And I should not see "Your parents must be mean."
Feature: User deletes reply
  In order to moderate page content
  As a user
  I want to delete a reply

  Scenario: User deletes a reply
    Given I am signed in
    And I have the following mixes:
      | title       | artist | admin          |
      | Buddy Holly | Weezer | me@example.com |
    And I posted the following comments in mix "Buddy Holly":
      | time | content            |
      | 0    | Sweet music video! |
    And I posted the following replies to comment "Sweet music video!":
      | content     |
      | Happy Days! |
    When I view mix "Buddy Holly"
    And I click element ".reply-row .edit-comment"
    Then I should see "Sweet music video!"
    And I should not see "Happy Days!"

  Scenario: Admin deletes a user reply
    Given I am signed in
    And I have the following mixes:
      | title         | artist        | admin          |
      | Time to Waste | Alkaline Trio | me@example.com |
    And I posted the following comments in mix "Time to Waste":
      | time | content             |
      | 0    | Spooky piano intro. |
    And user "bob@example.com" with password "password1"
    And user "bob@example.com" has access to mix "Time to Waste"
    And user "bob@example.com" posted the following replies to comment "Spooky piano intro.":
      | content              |
      | Too dramatic for me. |
    When I view mix "Time to Waste"
    And I click element ".reply-row .edit-comment"
    Then I should see "Spooky piano intro."
    And I should not see "Too dramatic for me."
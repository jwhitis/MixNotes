Feature: User deletes reply
  In order to moderate page content
  As a user
  I want to delete a reply

  Scenario: User deletes a reply
    Given I am signed in
    And I have the following mixes:
      | title       | artist |
      | Buddy Holly | Weezer |
    And mix "Buddy Holly" has the following comments:
      | time | content            |
      | 0    | Sweet music video! |
    And comment "Sweet music video!" has the following replies:
      | content     |
      | Happy Days! |
    When I view mix "Buddy Holly"
    And I click element ".reply-row .delete-comment"
    Then I should not see "Happy Days!"
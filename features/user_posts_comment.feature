Feature: Users posts comment
  In order to leave feedback about a mix
  As a user
  I want to post a comment

  Scenario: User posts a comment while playhead is at 0
    Given I am signed in
    And I have the following mixes:
      | title            | artist    |
      | Paranoid Android | Radiohead |
    And mix "Paranoid Android" has the following comments:
      | time | content        |
      | 0    | Awesome intro! |
    When I view mix "Paranoid Android"
    Then I should see "0:00"
    And I should see "Awesome intro!"
    And I should see "me@example.com"

  Scenario: User posts a comment while playhead is at 60
    Given I am signed in
    And I have the following mixes:
      | title  | artist          |
      | Oxygen | The Impossibles |
    And mix "Oxygen" has the following comments:
      | time | content   |
      | 60   | Rock out! |
    When I view mix "Oxygen"
    Then I should see "1:00"
    And I should see "Rock out!"
    And I should see "me@example.com"
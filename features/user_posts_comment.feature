Feature: Users posts comment
  In order to leave feedback about a mix
  As a user
  I want to post a comment

  Scenario: User posts a comment while playhead is at 0
    Given I am signed in
    And I have the following mixes:
      | title  | artist          | admin          |
      | Oxygen | The Impossibles | me@example.com |
    And I posted the following comments in mix "Oxygen":
      | time | content        |
      | 0    | ATX represent! |
    When I view mix "Oxygen"
    Then I should see "0:00"
    And I should see "ATX represent!"
    And I should see "me@example.com"

  Scenario: User posts a comment while playhead is at 60
    Given I am signed in
    And I have the following mixes:
      | title            | artist    | admin          |
      | Paranoid Android | Radiohead | me@example.com |
    And I posted the following comments in mix "Paranoid Android":
      | time | content      |
      | 60   | Guitar solo! |
    When I view mix "Paranoid Android"
    Then I should see "1:00"
    And I should see "Guitar solo!"
    And I should see "me@example.com"
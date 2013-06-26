Feature: User uploads new mix
  In order to add to my list of viewable mixes
  As a user
  I want to upload a new mix

  Scenario: User enters title and artist but no file
    Given I am signed in
    When I go to the homepage
    And I click "Upload Mix"
    And I fill in "Title" with "Full Disclosure"
    And I fill in "Artist" with "Fugazi"
    And I press "Submit"
    Then I should see "Full Disclosure"
    And I should see "Fugazi"
    When I view mix "Full Disclosure"
    Then I should be listed as the admin
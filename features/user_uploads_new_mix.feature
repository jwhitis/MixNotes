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

  Scenario: User enters title but no artist or file
    Given I am signed in
    When I go to the homepage
    And I click "Upload Mix"
    And I fill in "Title" with "Basket Case"
    And I press "Submit"
    Then I should see "Artist can't be blank."
    And I should not see "Basket Case"

  Scenario: User enters artist but no title or file
    Given I am signed in
    When I go to the homepage
    And I click "Upload Mix"
    And I fill in "Artist" with "Green Day"
    And I press "Submit"
    Then I should see "Title can't be blank."
    And I should not see "Green Day"
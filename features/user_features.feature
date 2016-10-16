Feature: User
  Scenario: As a user I can see a welcome message
    Given I visit index page
    Then I see a "Welcome" message

  Scenario: As a user I can see a list of movies
    Given I visit index page
    And there is the "Superman" movie with a rating of 2
    Then I see a movie which title is "Superman"

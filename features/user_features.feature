Feature: As a User
  Scenario: I can see a welcome message
    Given I visit index page
    Then I see a "Welcome" message

  Scenario: I can see a list of movies
    Given I visit index page
    And there is the "Superman" movie with a rating of 2
    Then I see a movie which title is "Superman"

  Scenario: I can add a movie
    Given I visit index page
    And I click on "Add a movie" button
    When I fill the form for "Rambo" with a rating of 2
    Then I see "Rambo" has been added to the list of movies

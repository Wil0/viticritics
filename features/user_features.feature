Feature: As a User
  Background:
    Given I visit index page

  Scenario: I can see a welcome message
    Then I see a "Welcome" message

  Scenario: I can see a list of movies
    And there is the "Superman" movie with a rating of 2
    Then I see a movie which title is "Superman"

  Scenario: I can add a movie to the website
    When I click on "Añadir película" button
    And I fill the form for "Rambo" with a rating of 2
    Then I see "Rambo" has been added to the list of movies

  Scenario: I can see a review of a movie
    And there is the "Superman" movie with a rating of 2
    When I click on "Superman" button
    Then I see "Not a bad movie" as a review for "Superman"

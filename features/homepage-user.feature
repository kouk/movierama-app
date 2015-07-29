Feature: Visit homepage

    Background:
      Given the user "me@here.com" is signed in

    Scenario: user tries to submit a movie
        When I go to the home page
        And I click the link with the text: "Submit a movie"
        Then I should be on the page with the title: "Submit a movie to Movierama"


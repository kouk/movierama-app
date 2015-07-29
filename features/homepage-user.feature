Feature: Visit homepage

    Background:
      Given the user "me@here.com" is signed in

    @javascript
    Scenario: user tries to submit a movie
        When I go to the home page
        And I click the link with the text: "Submit a movie"
        Then I should see an input field named "movie_title"


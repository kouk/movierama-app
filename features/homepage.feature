Feature: Visit homepage (unregistered)

    Background:
      Given I am not logged in

    Scenario: Anonymous visits the homepage
        When I go to the home page
        Then I should be on the page with the title: "Movierama homepage"

Feature: Visit homepage (unregistered)


    Scenario: Anonymous signs in with invalid data
        Given I am not logged in
        When I go to the home page
        Then I should see a link with the text: "Sign in"
        When I click the link with the text: "Sign in"
        Then I should be on the page with the title: "Sign in to Movierama"
        And I should see the text: "Log in"
        When I sign in as "nonexistent@lala.com" with password "foobar"
        Then I should see the text: "Invalid login"


    Scenario: User signs in succesfully
        Given there is a user with the email "me@here.com" and the password "foobar123" and the password_confirmation "foobar123"
        When I go to the home page
        And I click the link with the text: "Sign in"
        Then I should be on the page with the title: "Sign in to Movierama"
        When I sign in as "me@here.com" with password "foobar"
        Then I should see the text: "Welcome me@here.com"


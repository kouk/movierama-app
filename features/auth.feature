Feature: Visit homepage (unregistered)


    @javascript
    Scenario: Anonymous signs in with invalid data
        Given I am not logged in
        When I go to the home page
        Then I should see a link with the text: "Sign in"
        When I click the link with the text: "Sign in"
        Then I should see the login popup
        When I sign in as "nonexistent@lala.com" with password "foobar"
        Then I should see the text: "Invalid email or password"
        And I should see a button with the text: "Log in"


    Scenario: User signs in succesfully
        Given there is a user with the email "me@here.com" and the password "foobar123" and the password_confirmation "foobar123"
        When I go to the home page
        And I click the link with the text: "Sign in"
        Then I should see the login popup
        When I sign in as "me@here.com" with password "foobar123"
        Then I should see the text: "Signed in as me@here.com"


    Scenario: User signs in unsuccesfully
        Given there is a user with the email "me@here.com" and the password "foobar123" and the password_confirmation "foobar123"
        When I go to the home page
        And I click the link with the text: "Sign in"
        Then I should see the login popup
        When I sign in as "me@here.com" with password "foobar"
        Then I should see the text: "Invalid email or password"

Feature: Authentication

So that I can write and run tasks
As a visitor
I want sign in, sign out and sign up(log in,  log out, registration)

Scenario: Registration
Given I am not log in and not registered yet sessions = nill User.all = nill
And on first main page visit root path index page
When click new user
And fill in email and password with correct values and confirm password
And click create
Then i am on main page
And see note about registration

Scenario: Log in
Given I am not logged user created
And on main page
When click log in
And fill in correct email and password
And lick log in
Then i am on main page and see that logged

Scenario: Log out
Given i am logged
When click log out
Then i am on main page and see message about log out


Feature: Authentication

So that I can write and run tasks
As a visitor
I want sign up, sign in and sign out

@checked
Scenario: Sign up
Given I am on the main page without account
When click new user and fill form
Then I am on main page and see message

@checked
Scenario: Sign in
Given I am not logged user created
When click log in and fill form with email and password
Then i am on main page and see that logged

@checked
Scenario: Sign out
Given i am logged
When click log out
Then i am on main page and see a log out message


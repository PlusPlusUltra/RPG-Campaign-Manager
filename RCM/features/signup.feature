Feature: User can create a new account
  As a visitor
  So that the system remembers me
  I want to create a new account

Scenario: Create a new account
  Given I am on the sign up page
  When I fill in "Email" with "test1@test.it"
  And I fill in "Username" with "test"
  And I fill in "Password" with "12345678"
  And I fill in "user[password_confirmation]" with "12345678"
  And I press "Sign up"
  Then I should be on the home page
  And I should see "Profile"
  When I follow "Profile"
  Then I should see "test"
  And I should see "test1@test.it"

Scenario: Can't create an account (username required)
  Given I am on the sign up page
  When I fill in "Username" with "test"
  And I fill in "Password" with "12345678"
  And I fill in "user[password_confirmation]" with "12345678"
  And I press "Sign up"
  Then I should see "Email can't be blank"

Feature: User can login to the system
  As a registered user
  So that I can interact with the system
  I want to log in the system

Scenario: Login success
  Given I am a registered user
  And I am on the login page
  When I fill in "user[login]" with "perottofederico@gmail.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should be on the home page
  And I should see "Logout"

Scenario: Login failure
  Given I am on the login page
  When I fill in "user[login]" with "ciao@dis.uniroma1.it"
  And I fill in "Password" with "CarmineMaria"
  And I press "Log in"
  Then I should be on the login page

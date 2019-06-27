Feature: Logout
	As a User
	I want to log out from my account
	So that I can prevent other people from using my account

Scenario:
	Given I am a registered user
	And I log in
	When I follow "Logout"
	Then I should be on the index page
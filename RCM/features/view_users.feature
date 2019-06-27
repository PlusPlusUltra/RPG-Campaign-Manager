Feature:
	As an Admin
	I want to view all the users
	So that I can easily find and manage all users

Scenario:
	Given I am a registered user
	And I log in
	When I follow "All Users"
	Then I should see "perottofederico@gmail.com"
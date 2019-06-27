Feature:
	As an Admin
	I want to elect a new Admin
	So that it can access Admin privileges

Scenario: Elect Admin
	Given there's another user
	And I am a registered user
	And I log in
	And I follow "All Users"
	When I follow "Upgrade to Admin"
	Then I should see "Admin"

Feature:
	As an Admin
	I want to ban a User
	So that it can no longer use the service

Scenario: Ban User
	Given there's another user
	And I am a registered user
	And I log in
	And I follow "All Users"
	When I follow "Block User"
	Then I should see "This user is blocked"

Scenario: Unban User
	Given there's another user
	And I am a registered user
	And I log in
	And I follow "All Users"
	When I follow "Block User"
	And I should see "This user is blocked"
	When I follow "Unblock User"
	Then I should see "User"
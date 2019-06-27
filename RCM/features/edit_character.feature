Feature:
	As a User
	I want to change something of an existing character
	So that I can update any changes

Scenario: Edit Character
	Given I am a registered user
	And I log in
	And I create a Character "name"
	And I follow "Edit"
	And I fill in "Info" with "descriz 123"
	When I press "Update Character"
	Then I should see "descriz 123"

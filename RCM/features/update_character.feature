Feature: Edit Character
	As a User
	I want to change something of an existing character
	So that I can update any changes

Scenario:
	Given I am a registered user
	And I log in
	And I create a Character "nome"
	And I follow "Edit"
	And I fill in "Info" with "Info 2"
	When I press "Update Character"
	Then I should be on the show character page
	And I should see "Info 2"
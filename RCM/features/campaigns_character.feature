Feature:
	As a Master
	I want to see all of the characters participating in the campaign
	So that I can build the perfect story for them

Scenario: Campaing's character
	Given I am a registered user
	And I log in
	And I create a Campaign "campaign 2"
	When I follow "Manage Characters"
	Then I should see "Character's Owner"
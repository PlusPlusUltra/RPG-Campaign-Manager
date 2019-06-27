Feature: Create Character
  As a user
  So that I can play wih my character
  I want to create a character

 Scenario: Create Character
 	Given I am a registered user
 	And I log in
 	When I follow "My Characters"
 	And I follow "Create New Character"
 	And I fill in "Name" with "nome"
 	And I fill in "Lvl" with "3"
 	And I select "race1" from "character[race]"
 	And I select "class1" from "character[class_type]"
 	And I fill in "Info" with "info"
 	And I press "Save Character"
 	Then I should see "nome"
 	And I should see "3"
 	And I should see "race1"
 	And I should see "class1"
 	And I should see "info"

Scenario: Can't create Character
	Given I am a registered user
 	And I log in
 	When I follow "My Characters"
 	And I follow "Create New Character"
 	And I fill in "Lvl" with "3"
 	And I select "race1" from "character[race]"
 	And I select "class1" from "character[class_type]"
 	And I fill in "Info" with "info"
 	And I press "Save Character"
 	Then I should be on the create character page

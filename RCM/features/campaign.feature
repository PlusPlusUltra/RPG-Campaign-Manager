Feature: Campaign
  As a user
  So that I can play wih my friends
  I want to create a campaign

 Scenario: Create Campaign
 	Given I am a registered user
 	And I log in
 	When I follow "My Campaigns"
 	And I follow "Create New Campaign"
 	And I fill in "Title" with "titolo"
 	And I fill in "Description" with "desc"
 	And I press "Save Campaign"
 	Then I should see "titolo"
 	And I should see "desc"

 Scenario: Can't Create Campaign
 	Given I am a registered user
 	And I log in
 	When I follow "My Campaigns"
 	And I follow "Create New Campaign"
 	And I press "Save Campaign"
 	Then I should be on the create_campaign page

 Scenario: Edit Campaign
 	Given I am a registered user
 	And I log in
 	And I create a Campaign "campaign 2"
 	When I follow "Edit"
 	And I fill in "Description" with "ajeje"
 	And  I press "Update Campaign"
 	Then I should see "ajeje"

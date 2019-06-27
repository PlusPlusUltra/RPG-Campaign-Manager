Feature:
	As a User
	I want to to change my password
	So that I have a new, safer password

Scenario: Change password
	Given I am a registered user
	And I log in
	When I follow "View Profile"
  	And I follow "Edit Your Profile"
  	And I fill in "user[password]" with "123456789"
  	And I fill in "user[password_confirmation]" with "123456789"
  	And I fill in "user[current_password]" with "121345678"
  	And I press "Update"
  	Then I am on the home page
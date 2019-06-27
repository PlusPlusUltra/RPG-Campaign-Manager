Feature: Edit account
  As a registered user
  So that I can change the info about me
  I want to edit my account

Scenario: Edit account
  Given I am a registered user
  And I log in
  When I follow "View Profile"
  And I follow "Edit Your Profile"
  And I fill in "Username" with "chachacha"
  And I fill in "user[current_password]" with "12345678"
  And I press "Update"
  Then I am on the home page
  When I follow "View Profile"
  Then I should see "chachacha"

Scenario: Delete Account
  Given I am a registered user
  And I log in
  When I follow "View Profile"
  And I follow "Edit Your Profile"
  And I follow "Cancel my account"
  Then I should be on the index page
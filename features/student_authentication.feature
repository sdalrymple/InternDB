Feature: ensure student is logged in

Background:
	Given I am on the login page

Scenario: I give a valid username/password
	Given I give a valid username and password
	Then I should be directed to the InternDB home page

Scenario: I give an invalid username/password
	Given I give an invalid username and password
	Then I should be directed to the InternDB login page 
	And I should see "Login Unsuccessful"
	
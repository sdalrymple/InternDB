Feature: display the InternDB home page
  
Scenario: User not logged in.

  Given that I am not logged in
  Then I should be on the login page

Scenario: User is logged in.

  Given that I am logged in
  Then I should be on the InternDB home page

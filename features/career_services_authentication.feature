Feature: ensure admin is locked in
  
Scenario: User not logged in.

  Given that I am not logged in
  And I try to visit the homepage
  Then I should be on the login page

Scenario: User is logged in.

  Given that I am logged in
  And I try to visit the homepage
  Then I should be on the InternDB home page

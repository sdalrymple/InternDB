Feature: Give approve and reject capabilities to the Admin Credentialed

  As a career services counselor,
  So that I can moderate what is being posted,
  I want to be able to approve and reject all posts


Background:

 Given There is at least one post in the approval log
 And I am viewing one of those posts
 And that I am logged in
 And that I am and admin


Scenario: Approve Post
  When I press "Approve"
  Then I should be on the approval log page
  And I should see "Post has been approved"

Scenario: Deny Post
  When I press "Deny"
  Then I should be on the approval log page
  And I should see "Post has been denied, student has been notified"

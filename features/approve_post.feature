Feature: Give approve and reject capabilities to the Admin Credentialed

  As a career services counselor,
  So that I can moderate what is being posted,
  I want to be able to approve and reject all posts


Background:


#Given the there exists a experience named "exp1" with the following data:
# accepted | approved | contact | extended | function | industry | location | organization | paid | rating | id  |
# true     | false    | Mr. Lee | true     | QA       | software | NYC      | Google       | true | 5      | 999 |
  
  Given that I am logged in as an admin
  And I am on the view review page
  

Scenario: Approve Post
  When I press "Approve"
  Then I should be on the approval log page
  And I should see "Post has been approved!"

Scenario: Deny Post
  When I press "Deny"
  Then I should be on the approval log page
  And I should see "Post has been denied, student has been notified"

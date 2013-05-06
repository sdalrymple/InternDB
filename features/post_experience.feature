Feature: User can manually post an experience

Scenario: Add an experience

  Given that I am logged in 
  And I am on the InternDB home page
  When I follow "Share your experience"
  Then I should be on the Create New Review page
  And I press "Submit"
  Then I should be on the InternDB home page
  And I should see "Your experience at was added successfully!"

  

Feature:  Give the correct user the ability to change a post

  As a carrer services councelor,
  So that I can fix small gramatical Errors,
  I want to be able to edit posts




Background:

#Given That I am logged in 
#And I am an Admin
Given that I am logged in as an admin
And I am on the view review page


Scenario:

When I press "Edit"
Then I should be on the edit page
When I fill in "experience_hands_on_review" with "two thumbs up"
And I press "Submit"
Then I should see "Post has been changed"
And I should be on the view review page




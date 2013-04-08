Feature:  Give the correct user the ability to change a post

  As a carrer services councelor,
  So that I can fix small gramatical Errors,
  I want to be able to edit posts




Background:

Given That I am logged in 
And I am an Admin
And I viewing a post


Scenario:

When I press "Edit"
Then I should be on the edit page
When I put "two thumbs up" in the review field
And I Press enter
Then I should see "Post has been changed"
And I should be viewing the same post as before




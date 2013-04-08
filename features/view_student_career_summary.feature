Feature: View Student Career Summary

As a Career Services Employee, 
So that i can give career advice, 
I want to be able to see all of a given student's posts

Background:

Given There is at least one post made by student
And that I am logged in
And that I am an admin
And I am on the View Student Career Summary page

Scenario: View Student Career Summary

Then I should see all the posts made by the student

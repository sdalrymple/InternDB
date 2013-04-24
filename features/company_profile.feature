Feature: See an Overview for a Company

  As a student,
  So That I can see if an Internship is worth Pursuing,
  I want to see all the reviews for a company.

Background:
  Given that I am logged in 
  And That I am on the InternDB homepage.
  And the following experiences exist:
  | accepted | approved | contact    | extended | function | industry  | location      | organization    | paid  | rating | id  |
  | true     | true     | Mr. Lee    | true     | QA       | software  | NYC           | Google          | true  | 5      | 999 |
  | true     | true     | Jim        | true     | Analyst  | Finance   | Chicago       | Bank of America | false | 2      | 205 |
  | false    | true     | Izzo       | false    | Coaching | Education | Lansing       | Michigan State  | true  | 4      | 33  |
  | false    | true     | Bob Barker | true     | PA       | TV        | LA            |  CBS            | false | 4      | 100 |
  | false    | true     | Lumbergh   | true     | QA       | software  | Ohio          | Initech         | false | 1      | 56  |
  | true     | true     | Vin Diesel | true     | Design   | software  | San Francisco | Google          | true  | 4      | 426 |
Scenario: Look at Google Reviews:

  When I click "Google"
  Then I should be on the "Google" company overview page
  And I should see an average rating
  And I should see all the approved "Google" experiences



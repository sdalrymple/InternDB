
Feature: See an Overview for a Company

  As a student,
  So That I can see if an Internship is worth Pursuing,
  I want to see all the reviews for a company.

Background:
  Given that I am logged in 
  And the following experiences exist:
  | accepted | approved | contact    | extended | function | industry  | city          | organization    | paid  | rating | id  | state |  season  |  year  | repeat | composite | hands_on_rating | network_rating | exposure_rating |
  | true     | true     | Mr. Lee    | true     | QA       | software  | NYC           | Google          | true  | 5      | 999 |  NY   |  Spring  |  2012  | true   | 4.33      |  2              |  1             |     3           |
  | true     | true     | Jim        | true     | Analyst  | Finance   | Chicago       | Bank of America | false | 2      | 205 |  IL   |  Summer  |  2013  | false  | 2.33      |  3              |   2            |     5           |
  | false    | true     | Izzo       | false    | Coaching | Education | Lansing       | Michigan State  | true  | 4      | 33  |  MI   |  Fall    |  2012  | true   |  5        |  4              |    2           |      2          |
  | false    | true     | Bob Barker | true     | PA       | TV        | LA            |  CBS            | false | 4      | 100 |  CA   |  Winter  |  2011  | false  |  4.67     |  5              |      3         |          5      |
  | false    | true     | Lumbergh   | true     | QA       | software  | Ohio          | Initech         | false | 1      | 56  |  OH   |  Spring  |  2013  | true   |  3.33     |  2              |       2        |       3         |
  | true     | true     | Vin Diesel | true     | Design   | software  | San Francisco | Google          | true  | 4      | 426 |  CA   |  Summer  |  2011  | false  |  4        |  4              |        4       |       5         |

  And I am on the InternDB home page

Scenario: Look at Google Reviews:

  When I follow the first "Google"
  Then I should be on the "Google" company overview page
  And I should see "Average Ratings"
  And I should see all the approved Google experiences



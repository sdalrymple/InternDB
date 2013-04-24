Feature: Sort Reviews on the Homepage by date of intership, date of review or rating.

  As a Student,
  So that I can see information more easily,
  I want to be able to sort by the date of the review, the the date of the experience, or the rating the experience was given.


Background: I am on the Homepage, Logged In, and Experiences Exist

  Given that I am logged in
  Given I am on the InternDB Homepage
  And the following experiences exist:
  | accepted | approved | contact    | extended | function | industry  | location | organization    | paid  | rating | id  |
  | true     | true     | Mr. Lee    | true     | QA       | software  | NYC      | Google          | true  | 5      | 999 |
  | true     | true     | Jim        | true     | Analyst  | Finance   | Chicago  | Bank of America | false | 2      | 205 |
  | false    | true     | Izzo       | false    | Coaching | Education | Lansing  | Michigan State  | true  | 4      | 33  |
  | false    | true     | Bob Barker | true     | PA       | TV        | LA       |  CBS            | false | 4      | 100 |
  | false    | true     | Lumbergh   | true     | QA       | software  | Ohio     | Initech         | false | 1      | 56  |

Scenario: I want to sort by rating:


  When I select "rating" from "tosort"
  Then the experiences should be sorted by "rating".

Scenario: I want to sort by Date of Posting.

  When I select "Post Date" from "tosort"
  Then the experiences should be sorted by "Post Date"

Scenario: I want to sort by Date of Internship

  When I select "Internship Date" from "tosort"
  Then the experiences shoul be sorted by "Intership Date"




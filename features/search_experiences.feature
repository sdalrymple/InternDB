Feature: Seach for the reviews using various fields

  As a student,
  So that I can explore my options,
  I want to be able to search by {company, job function, location, industry, and keywords}.


Background: I want to search by certain fields

  Given that I am on the Search Page.
  And the following experiences exist:
  | accepted | approved | contact    | extended | function | industry  | location | organization    | paid  | rating | id  |
  | true     | true     | Mr. Lee    | true     | QA       | software  | NYC      | Google          | true  | 5      | 999 |
  | true     | true     | Jim        | true     | Analyst  | Finance   | Chicago  | Bank of America | false | 2      | 205 |
  | false    | true     | Izzo       | false    | Coaching | Education | Lansing  | Michigan State  | true  | 4      | 33  |
  | false    | true     | Bob Barker | true     | PA       | TV        | LA       |  CBS            | false | 4      | 100 |
  | false    | true     | Lumbergh   | true     | QA       | software  | Ohio     | Initech         | false | 1      | 56  |

Scenario: Search for Google reviews.

  When I fill in "Google" for "company"
  And I press "Search"
  Then I should only see "Google" for companies

Scenario: Search for paid Internships only
  When I select "paid" from "paid?" 
  And I press "Search" 
  Then I should only see "Paid" for paid?



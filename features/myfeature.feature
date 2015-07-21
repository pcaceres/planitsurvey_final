Feature: As a Planit Customer
I want to acceess Planit's online questionnaire to provide them the profile of the organization

#SUBMIT SCENARIO INCOMPLETE / INVALID INPUT ON SURVEY
@submit_incomplete_survey
Scenario Outline: login as a registered client, populate form and submit data
Given I navigate to Planit web survey login page <pageurl> <token>
And I get data from <input> and populate form
And I click submit button
Then I should see mandatory question warnings

Examples:
| pageurl	|	token  	 | input 												|
| "http://localhost/planitsurveyportal/users/login?token=" 	|	"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIyIiwidXNlcm5hbWUiOiJwY2FjZXJlcyIsImxvbmduYW0iOiJQYXRyaWNrIENhY2VyZXMiLCJzdXJ2ZXlpZCI6MSwic3VydmV5bmFtZSI6IlRlY2ggU3VydmV5In0.sFlpbK7wotJRZAyDboD3UbYde6385OO2B_uxgdyuVBQ" | "C:\Automation\planitsurvey_final\lib\pages\data\user_answers_incomplete.csv"	|

#SAVE DATA SCENARIO
@save_survey
Scenario Outline: login as a registered client, populate form and save data
Given I navigate to Planit web survey login page <pageurl> <token>
And I get data from <input> and populate form 
And I click save button 
Then I should see successful save confirmation message

Examples:
| pageurl	|	token  	 | input 					|
| "http://localhost/planitsurveyportal/users/login?token=" 	|	"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIyIiwidXNlcm5hbWUiOiJwY2FjZXJlcyIsImxvbmduYW0iOiJQYXRyaWNrIENhY2VyZXMiLCJzdXJ2ZXlpZCI6MSwic3VydmV5bmFtZSI6IlRlY2ggU3VydmV5In0.sFlpbK7wotJRZAyDboD3UbYde6385OO2B_uxgdyuVBQ" | "C:\Automation\planitsurvey_final\lib\pages\data\user_answers_save.csv"	|

#SUBMIT SCENARIO
@submit_survey
Scenario Outline: login as a registered client, populate form and submit data
Given I navigate to Planit web survey login page <pageurl> <token>
And I get data from <input> and populate form
And I click submit button 
And I click confirm button
Then I should see successful submit confirmation message

Examples:
| pageurl	|	token  	 | input 												|
| "http://localhost/planitsurveyportal/users/login?token=" 	|	"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIxIiwidXNlcm5hbWUiOiJqYWZyaWNhIiwibG9uZ25hbSI6IkpvZWwgQWZyaWNhIiwic3VydmV5aWQiOjEsInN1cnZleW5hbWUiOiJUZWNoIFN1cnZleSJ9.MC880Roj9NcripQd_MGxlHMfiBGHhXoIuYpM6mYjPTw" | "C:\Automation\planitsurvey_final\lib\pages\data\user_answers.csv"	|


#ACCESS SURVEY FORM WITH INVALID TOKEN
@invalid_token_survey
Scenario Outline: login as a registered client using invalid token
Given I navigate to Planit web survey login page <pageurl> <token>
Then I receive invalid token notification

Examples:
| pageurl	|	token  	 |
| "http://localhost/planitsurveyportal/users/login?token=" 	|	"zeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIxIiwidXNlcm5hbWUiOiJqYWZyaWNhIiwibG9uZ25hbSI6IkpvZWwgQWZyaWNhIiwic3VydmV5aWQiOjEsInN1cnZleW5hbWUiOiJUZWNoIFN1cnZleSJ9.MC880Roj9NcripQd_MGxlHMfiBGHhXoIuYpM6mYjPTw"	 |


#NAVIGATES BACK/CANCEL FROM SURVEY FORM
@cancel_survey
Scenario Outline: login as a registered client, populate form and nagivates back
Given I navigate to Planit web survey login page <pageurl> <token>
And I get data from <input> and populate form
Then I cancel survey


Examples:
| pageurl	|	token  	 | input 												|
| "http://localhost/planitsurveyportal/users/login?token=" 	|	"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIxIiwidXNlcm5hbWUiOiJqYWZyaWNhIiwibG9uZ25hbSI6IkpvZWwgQWZyaWNhIiwic3VydmV5aWQiOjEsInN1cnZleW5hbWUiOiJUZWNoIFN1cnZleSJ9.MC880Roj9NcripQd_MGxlHMfiBGHhXoIuYpM6mYjPTw"	 | "C:\Automation\planitsurvey_final\lib\pages\data\user_answers_save.csv"	|

#NAVIGATES BACK/CANCEL FROM CONFIRMATION FROM
@submit_cancel_survey
Scenario Outline: login as a registered client, populate form and nagivates back
Given I navigate to Planit web survey login page <pageurl> <token>
And I get data from <input> and populate form
And I click submit button 
And I navigate back to survey
Then I should be redirected to survey form

Examples:
| pageurl	|	token  	 | input 												|
| "http://localhost/planitsurveyportal/users/login?token=" 	|	"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiIxIiwidXNlcm5hbWUiOiJqYWZyaWNhIiwibG9uZ25hbSI6IkpvZWwgQWZyaWNhIiwic3VydmV5aWQiOjEsInN1cnZleW5hbWUiOiJUZWNoIFN1cnZleSJ9.MC880Roj9NcripQd_MGxlHMfiBGHhXoIuYpM6mYjPTw"	 | "C:\Automation\planitsurvey_final\lib\pages\data\user_answers.csv"	|


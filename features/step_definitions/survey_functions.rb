#Planit web survey

Given(/^I navigate to Planit web survey login page "([^"]*)" "([^"]*)"$/) do | pageurl, token |
	on_page HomePage do | page |
		page.navigate pageurl, token
	end 
end
 
When(/^I enter (.*?) to access questionnaire$/) do | token |
	@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds

	txtToken = @browser.find_element(:xpath, "//input[@name='token_id']")
 	@wait.until { txtToken }
 	txtToken.send_key token
 	btnSubmit = @browser.find_element(:xpath, "//input[@name='submit']")
 	btnSubmit.click
end

When(/^I get data from "([^"]*)" and populate form$/) do | input |
	on_page SurveyPage do | item |

		surveyAns = Array.new
		#READ DATA FILE push elements to array
		CSV.foreach(input) do |row|
  			surveyAns.push(row.inspect)
		end

		#Parse array and pass data to populate form
		row = Array.new

		#Checkbox input and validation
		for x in 1..surveyAns.count-1

			#split question to answers
	  		row = surveyAns[x].split(",")

	  		#parse to conform with form labels
			questionID = row[0].gsub(/[\["\],]/, "").strip
			objOptionLabel = @browser.find_elements(:xpath, "//div[contains(text(), 'Question #{questionID}.')]/following-sibling::div/label")
	  		val = surveyAns[x].to_s.gsub(/[\["\],]/, " ").strip
	  		objOptionLabel.each do | idx |
	  				obj =  @browser.find_element(:xpath, "//div[contains(text(), 'Question #{questionID}.')]/following-sibling::div/input")
		  			chkLabel = idx.text
		  			if obj.attribute("type") == "checkbox"	
			  			chkInput = @browser.find_element(:xpath, "//div[contains(text(), 'Question #{questionID}.')]/following-sibling::div/label[contains(text(),'#{chkLabel}')]/preceding-sibling::input")
				 		if val.include? chkLabel
		 		 			if chkInput.selected? == false
				 				chkInput.click
				 			end
				 		else
				 			if chkInput.selected? == true
				 				chkInput.click
				 			end
				 		end
  					end
  			end
  		end
	  
		#Textbox and radio buttons
		row = Array.new
		for x in 1..surveyAns.count-1
	  		row = surveyAns[x].split(",")
	  		for y in 1..row.count-1
	  			questionID = row[0].gsub(/[\["\],]/, "").strip
	  			answerID = row[y].gsub(/[\["\],]/, "").strip
	  			item.populate_form questionID, answerID
	  		end
		end
	end
end

When(/^I click submit button$/) do
	on_page SurveyPage do | page |
		page.submit_form
	end
end


When(/^I should see mandatory question warnings$/) do
	on_page SurveyPage do | page |
		page.submit_form_incomplete
	end
end


When(/^I click confirm button$/) do
	on_page SurveyPage do | page |
		page.confirm_form
	end
end

When(/^I should see successful submit confirmation message$/) do
	on_page ConfirmPage do | page |
		page.submit_confirmation
	end
end

When(/^I should see successful save confirmation message$/) do
	on_page ConfirmPage do | page |
		page.save_confirmation
	end
end

When(/^I click save button$/) do
	on_page SurveyPage do | page |
		page.save_form
	end
end

When(/^I receive invalid token notification$/) do
	on_page SurveyPage do | page |
		page.invalid_token
	end
end

When(/^I cancel survey$/) do
	on_page SurveyPage do | page |
		page.alert_leave
	end
end

When(/^I navigate back to survey$/) do
	on_page SurveyPage do | page |
		page.return
	end
end

When(/^I should be redirected to survey form$/) do
	on_page SurveyPage do | page |
		page.check_form
	end
end



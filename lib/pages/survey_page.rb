
require 'test/unit'
extend Test::Unit::Assertions

class SurveyPage < Test::Unit::TestCase
	include PageObject

	#Populate survey form
	def populate_form survey_question, survey_answer
		begin
			btnSubmit = @browser.find_element(:xpath, "//input[@id='submit']")
			if btnSubmit.displayed? == true
				frmSurvey = @browser.find_elements(:xpath, "//form[@id='AnswerAddForm']")
					frmSurvey.each do | list |
						#Find question number from the form
						divQuestion = @browser.find_element(:xpath, "//div[contains(text(), 'Question #{survey_question}.')]")
						if divQuestion.displayed? == true 

							objOption = @browser.find_elements(:xpath, "//div[contains(text(), 'Question #{survey_question}.')]/following-sibling::div/input")
			
						 	objOption.each do | ans |
						 		#INPUT TYPE = TEXT
								if ans.attribute("type") == "text"	

					 					#parse answer per textbox in question
					 					var = survey_answer.split(":")
					 					objTextbox = @browser.find_element(:xpath, "//div[contains(text(), 'Question #{survey_question}.')]/following-sibling::div/label[contains(text(), '#{var[0]}')]/following-sibling::input")
					 					objTextbox.clear
						 				objTextbox.send_key var[1]
						 				break

								#NON-TEXT INPUT TYPE
						 		else 
						 			objOption = @browser.find_element(:xpath, "//div[contains(text(), 'Question #{survey_question}.')]/following-sibling::div/label[contains(text(), '#{survey_answer}')]/preceding-sibling::input")
							 		objType = objOption.attribute("type")
							 		case objType
							 		when "checkbox"
							 			#DONE IN PRIOR BLOCK
							 			#if objOption.selected? != true 
							 			#	objOption.click 
							 			#end
							 		when "radio"
							 			if objOption.selected? != true 
							 				objOption.click 
										end
							 		else
							 			puts "No option to enter"
							 		end
							 	end	#NON-TEXT INPUTS 
							end #do loop input
						end #div question items
				  	end	#frmSurvey loop	
			end #end if btnSubmit
		rescue Exception => e
			#puts e.message
			e.backtrace.inspect
		end

	end #def

	def save_form
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds

		begin 	
			btnSave = @browser.find_element(:xpath, "//input[@id='save']")
			if btnSave.displayed? == true
				btnSave.click

				msg_confirm = @browser.find_element(:xpath, "//div[contains(text(), 'survey data have been saved.')]")
				@wait.until { msg_confirm }
				puts "Input data successfully saved"
			end
		rescue Exception => e
			#puts e.message
			e.backtrace.inspect
		end
	end

	def submit_form
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds

		btnSubmit = @browser.find_element(:xpath, "//input[@id='submit']")
		if btnSubmit.displayed? == true
			btnSubmit.click
		else
			puts "\nSubmit button not displayed"
		end
	end

	def submit_form_incomplete
		err = @browser.find_element(:xpath, "//div[@class='mainerrorcontainer']")
		if err.displayed? == true
				errCtr = @browser.find_elements(:xpath, "//div[@class='error']").count
 				status = err.displayed?	
				assert_equal(true, status)
				puts "#{errCtr} Mandatory question(s) unanswered"
		else
			puts "\nSubmit button not displayed"
		end
	end

	def confirm_form

		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds
		msg_confirm = @browser.find_element(:xpath, "//div[contains(text(), 'data have been saved.')]")
 		@wait.until { msg_confirm }
		
		begin
			btnConfirm = @browser.find_element(:xpath, "//input[@id='confirm']")
			if btnConfirm.displayed? == true
				btnConfirm.click
			else
				puts "\nSubmit button not displayed"
			end

		rescue Selenium::WebDriver::Error::NoSuchElementError
			msg_confirm = @browser.find_element(:xpath, "//div[contains(text(), 'data have been saved.')]")
			@wait.until { msg_confirm }
	    end

	end

	def invalid_token
		begin
			errPage = @browser.find_element(:xpath, "//div[@class='mainerrorcontainer']").displayed?
			assert_equal(true, errPage,"Error page for login authentication is not displayed")

		rescue Exception => e
			#puts e.message
			e.backtrace.inspect
	    end
	end

	def alert_leave
		begin
			@browser.navigate.to back
			alert = @browser.switch_to.alert
			sleep 1
			alert.accept
			puts "User successfuly navigates back in the previous page"
		rescue Selenium::WebDriver::Error::NoSuchElementError

	    end
	end
	
	#Navigates back to previous page
	def return
		begin 
			@browser.redirect_to back
		rescue Exception => e
			#puts e.message
			e.backtrace.inspect
		end
	end


	def check_form
		begin 
			btnSubmit = @browser.find_element(:xpath, "//input[@name='submit']").displayed?
			assert_equal(true, btnSubmit,"User not redirected to survey form")
		rescue Exception => e
			#puts e.message
			e.backtrace.inspect
		end
	end
end


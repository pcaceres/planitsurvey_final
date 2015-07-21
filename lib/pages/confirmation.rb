
require 'test/unit'
extend Test::Unit::Assertions

class ConfirmPage < Test::Unit::TestCase
	include PageObject

	def submit_confirmation
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds
#		msgConfirm = @browser.find_element(:xpath, "//div[@id='processing_msg_successMessage']")
		msgConfirm = @browser.find_element(:xpath, "//div[contains(text(), 'Your survey data have been sent to Planit.  Thank you for providing your time in completing the survey.')]")
		@wait.until { msgConfirm }	
		status = msgConfirm.displayed?	
		assert_equal(true, status, "Confirmation page not displayed!")
	end

	def save_confirmation
		@wait = Selenium::WebDriver::Wait.new(:timeout => 10) #seconds
		msgConfirm = @browser.find_element(:xpath, "//div[contains(text(), 'survey data have been saved.')]")
		@wait.until { msgConfirm }	
		status = msgConfirm.displayed?	
		assert_equal(true, status, "Confirmation page not displayed!")
	end
end
class HomePage
	include PageObject
	#Navigate to homepage
	def navigate pageurl, token

		path = pageurl+token
		@browser.navigate.to path
	  	@browser.manage.window.maximize

		begin 
			assert_equal(true, @browser.find_element(:xpath, "//input[@name='submit']"), "User not redirected to survey questionnaire" )
		rescue Exception => e
			#puts e.message
			e.backtrace.inspect
		end
	end
end


require 'selenium-webdriver'
require 'csv'


Before do
  @browser = Selenium::WebDriver.for :firefox
end


After do
  @browser.quit
end
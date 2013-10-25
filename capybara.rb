require 'bundler/setup'
require 'capybara'
require 'capybara/dsl'
require 'selenium/webdriver'
require 'pry'

include Capybara::DSL

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['browser.download.dir'] = "tmp"
  profile['browser.helperApps.neverAsk.saveToDisk'] = "*" # content-type of file that will be downloaded
  Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile)
end
Capybara.current_driver = :selenium
Capybara.app_host = 'https://'

visit '/'

# fill_in 'username', :with => 'username'
# fill_in 'password', :with => 'password'
# 
# click_button 'Login'
# 
# click_link 'Something'

binding.pry
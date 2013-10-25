require 'bundler/setup'
require 'mechanize'
require 'pry'

@agent = Mechanize.new
@agent.user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:23.0) Gecko/20100101 Firefox/23.0"
@agent.get('https://') do |page|
  # Click the login link
  #login_page = a.click(page.link_with(:text => /Log In/))

  # Submit the login form
  my_page = page.form_with(:action => '/login') do |f|
    f.username  = "username"
    f.password  = "password"
  end.click_button

  # my_page.links.each do |link|
  #   text = link.text.strip
  #   next unless text.length > 0
  #   puts text
  # end
end
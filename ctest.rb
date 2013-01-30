

require 'capybara'
require "capybara/rspec"
require 'rspec'
require 'capybara/poltergeist'
require 'rspec/autorun'
require "launchy"

Capybara.javascript_driver = :poltergeist
Capybara.app_host = 'http://commercesciences.com'
Capybara.default_driver = :poltergeist
RSpec.configure do |config|
	config.include Capybara::DSL
end	
describe "test" do
	subject {page}
	describe "signing in" do
		before do 
			visit '/'
			#fill_in "username", :with=>"roeiklein+2@gmail.com"
			#fill_in "password", :with=>"ranchan"
			#page.execute_script("$('.dd-content-wrapper').css('display','block');")
			#page.execute_script("$('.dd-content-wrapper').css('opacity','1');")
		end
		it "should redirect to config page" do
			#click_button "Login"
			click_link "About"
			current_url.should eq "#{Capybara.app_host}/about"
		end
	
	end
end

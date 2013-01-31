

require 'capybara'
require "capybara/rspec"
require 'rspec'
require 'capybara/poltergeist'
require 'rspec/autorun'
require "launchy"
require 'stringio'

@@output = StringIO.new

Capybara.register_driver :poltergeist do |app|
	Capybara::Poltergeist::Driver.new(app, {
			:js_errors => true,
			:inspector => true
		})
end

RSpec.configure do |config|
	config.include Capybara::DSL
end	
describe "test" do
	before do
		Capybara.javascript_driver = :poltergeist
		Capybara.app_host = 'http://www.wwbw.com/'
		Capybara.current_driver = :poltergeist
		Capybara.run_server = false
	end
	subject {page}
	describe "checkout button" do
		before { visit '/' }
		it "should redirect to checkout page", :js=>true do
			sleep 2
			find("#tb-checkout-label").trigger(:click)
			sleep 2
			current_url.should eq "#{Capybara.app_host}MyAccount/Cart.aspx"
		end
	end
	describe "site logo" do
		before { visit '/checkout' }
		it "should redirect to home page" do
			sleep 2
			find("#tb-site-logo-holder").trigger(:click)
			sleep 2
			current_url.should eq "#{Capybara.app_host}"
		end
	end

end

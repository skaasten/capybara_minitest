require 'minitest/autorun'
require 'capybara'
require 'capybara/dsl'
require 'byebug'
require 'faker'


Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'http://shaunfirst.freshbooks.com'

class LoginTest < Minitest::Test
  include Capybara::DSL

  def test_login
    visit '/'
    fill_in 'username', with: ENV['username']
    fill_in 'password', with: ENV['password']
    click_on "Log in"
    assert page.has_content? 'Overview'
  end

  def test_new_client
    visit '/createUser'
    fill_in 'email', with: Faker::Internet.email
    fill_in 'fname', with: Faker::Name.first_name
    fill_in 'lname', with: Faker::Name.last_name
    click_on "Save"
    assert page.has_content? 'Your client has been created.'
  end
end

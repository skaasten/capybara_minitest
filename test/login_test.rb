require 'minitest/autorun'
require 'capybara'
require 'capybara/dsl'
require 'debugger'

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
end

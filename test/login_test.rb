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
    debugger
  end
end

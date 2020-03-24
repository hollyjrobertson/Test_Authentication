# Pulls Test_helper method (useful for the "minitest/reporters" - test bar)
require 'test_helper'

class TheControllerTest < ActionDispatch::IntegrationTest
  # Defines @base_title to be used in many tests
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  # Test that verifies the view/static_pages/home.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/home.html.erb is "Home + @base_title"
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  # Test that verifies the view/static_pages/help.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/help.html.erb is "Help + @base_title"
  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  # Test that verifies the view/static_pages/about.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/about.html.erb is "About + @base_title"
  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  # Test that verifies the view/static_pages/contact.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/contact.html.erb is "Contact + @base_title"
  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  # Test that verifies the view/users/index.html.erb returns a 200 success code
  test "should get users" do
    get users_path
    assert_response :success
  end

  # Test that verifies the view/microposts/index.html.erb returns a 200 success code
  test "should get microposts" do
    get microposts_path
    assert_response :success
  end

end
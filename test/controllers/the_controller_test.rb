# Pulls Test_helper method (useful for the "minitest/reporters" - test bar)
require 'test_helper'

class TheControllerTest < ActionDispatch::IntegrationTest
  puts "************************************"
  puts "********Testing Begin***************"
  # Defines @base_title to be used in many tests
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  # Test that verifies the root_path returns a 200 success code
  test "should get root" do
    get root_path
    assert_response :success
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/home.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/home.html.erb is "Home + @base_title"
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/help.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/help.html.erb is "Help + @base_title"
  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/about.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/about.html.erb is "About + @base_title"
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/contact.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/contact.html.erb is "Contact + @base_title"
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/users/index.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/contact.html.erb is "Users - Index + @base_title"
  test "should get users" do
    get users_path
    assert_response :success
    assert_select "title", "Users - Index | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/users/index.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/contact.html.erb is "Users - Index + @base_title"
  test "should get microposts" do
    get microposts_path
    assert_response :success
    assert_select "title", "Microposts - Index | #{@base_title}"
    puts name + " passed"
  end
  # Test that tests the links
  test "layout links" do
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", microposts_path
    puts name + " passed"
  end

  test "should get signup" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign Up | #{@base_title}"
    puts name + " passed"
  end

end
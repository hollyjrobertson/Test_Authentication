# Pulls Test_helper method (useful for the "minitest/reporters" - test bar)
require 'test_helper'

class TheControllerTest < ActionDispatch::IntegrationTest
  puts "************************************"
  puts "********Testing Begin***************"
  # Defines @base_title to be used in many tests
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
    @user = users(:michael)
  end

  # Test that verifies the root_path returns a 200 success code
  test "root path" do
    get root_path
    assert_response :success
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/home.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/home.html.erb is "Home + @base_title"
  test "home path" do
    get home_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/help.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/help.html.erb is "Help + @base_title"
  test "help path" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/about.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/about.html.erb is "About + @base_title"
  test "about path" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/static_pages/contact.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/contact.html.erb is "Contact + @base_title"
  test "contact path" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/sessions/new.html.erb returns a 200 success code
  # Test that verifies the title of view/sessions/new.html.erb is "Log in + @base_title"
  test "login path" do
    get login_path
    assert_response :success
    assert_select "title", "Log in | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the logout path returns a 200 success code
  #test "logout path" do
  # delete logout_path
  # assert_response :success
  # puts name + " passed"
  #end

  # Test that verifies the view/users/index.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/contact.html.erb is "Users - Index + @base_title"
  test "view users" do
    get users_path
    assert_response :success
    assert_select "title", "Users - Index | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the view/users/index.html.erb returns a 200 success code
  # Test that verifies the title of view/static_pages/contact.html.erb is "Users - Index + @base_title"
  test "view microposts" do
    get microposts_path
    assert_response :success
    assert_select "title", "Microposts - Index | #{@base_title}"
    puts name + " passed"
  end

  # Test that tests the links on navigation bar are there
  test "layout links" do
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path
    puts name + " passed"
  end

  # Test that tests the signup path works
  test "signup path" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign Up | #{@base_title}"
    puts name + " passed"
  end

  # Test that verifies the save user doesn't save to db
  test "save user" do
    assert !@user.valid?
    puts name + " passed"
  end

  # Test that verifies a name is present before saving to db
  test "name present" do
    @user.name = "     "
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies an email is present before saving to db
  test "email present" do
    @user.email = "     "
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies a name is no longer than 50 characters before saving to db
  test "name length" do
    @user.name = "a" * 51
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies an email is no longer than 255 characters before saving to db
  test "email length" do
    @user.email = "a" * 256
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies a user won't be saved to db due to an incorrectly formatted email
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
    puts name + " passed"
  end

  # Test that verifies a unique email must be used for a user before saving to db
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
    puts name + " passed"
  end

  # Test that verifies if a password is present before saving to db
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies if a password is a certain length before saving to db
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
    puts name + " passed"
  end

  # Test that verifies if a user can signup
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
      follow_redirect!
    end
    puts name + " passed"
  end

  # Test that verifies if a user can login
  test "verify a user can login" do
    get login_path
    log_in @user
    assert_equal(is_logged_in?, true, "True")
    puts name + " passed"
  end

  # Test that verifies if a user can logout
  test "verify a user can login then logout" do
    get login_path
    log_in @user
    assert_equal(is_logged_in?, true, "True")
    log_out @user
    assert_equal(is_logged_in?, false, "False")
    puts name + " passed"
  end

end
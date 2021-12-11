require "application_system_test_case"
class MainsTest < ApplicationSystemTestCase
  setup do
    @user = users(:u1)
  end

  test "login_success" do
    visit main_url
    fill_in "Username",with: @user.username
    fill_in "Password",with: 123456
    click_on "Login"
    assert_text "Movies today"
  end

  test "login_fail_wrong_username" do 
    visit main_url
    fill_in "Username",with: "#{@user.username}1"
    fill_in "Password",with: 123456
    click_on "Login"
    assert_selector id:"alert" ,text: "Wrong username or password"
  end

  test "login_fail_wrong_password" do 
    visit main_url
    fill_in "Username",with: @user.username
    fill_in "Password",with: 12345
    click_on "Login"
    assert_selector id:"alert" ,text: "Wrong username or password"
  end

  
end
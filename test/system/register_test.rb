require "application_system_test_case"

class RegistersTest < ApplicationSystemTestCase
  setup do
    @user = users(:u1)
  end

  test "Register_success" do
    visit main_url
    click_on "Register" ,match: :first
    fill_in "Username" ,with: "test2"
    fill_in "Firstname" ,with:"tester"
    fill_in "Lastname" ,with:"test"
    fill_in "Password" ,with: 123456
    fill_in "Confirm password" ,with: 123456
    click_on "Create User"
    assert_selector id:"notice" ,text: "User was successfully created."
    visit users_url
    assert_text "test2" 
  end

  test "Register_fail" do
    visit main_url
    click_on "Register" ,match: :first
    fill_in "Username" ,with: @user.username
    fill_in "Firstname" ,with:@user.firstname
    fill_in "Lastname" ,with:@user.lastname
    fill_in "Password" ,with: 123456
    fill_in "Confirm password" ,with: 123456
    click_on "Create User"
    assert_text "Please review the problems below"
  end
  
end

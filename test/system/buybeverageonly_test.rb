require "application_system_test_case"
class BuyBeverageOnlyTest < ApplicationSystemTestCase
  setup do
    @user = users(:u1)
  end

  test "buybeverageonly" do
    visit main_url
    fill_in "Username",with: @user.username
    fill_in "Password",with: 123456
    click_on "Login"
    click_on "Buy beverage"
    assert_text "Select Beverage"
    a = first("label").text 
    first("input[type='number']").set(1) 
    if (a.eql?("Salt Popcorn")) 
      click_on "Buy"
      assert_text "Beverage"
      assert_text "Name : Salt Popcorn"
      assert_text "Quantity : 1"
      assert_text "Price : 150"
    else 
      click_on "Buy"
      assert_text "Beverage"
      assert_text "Name : MyString"
      assert_text "Quantity : 1"
      assert_text "Price : 1"
    end
    assert "Summary order"

  end

end
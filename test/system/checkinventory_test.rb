require "application_system_test_case"
class CheckInventoryTest < ApplicationSystemTestCase
	setup do
    	@user = users(:u1)
  	end

  	test "checkinventory" do
  		visit main_url
    	fill_in "Username",with: @user.username
    	fill_in "Password",with: 123456
    	click_on "Login"
    	find("img[src='https://cdn.majorcineplex.com/uploads/movie/2771/thumb_2771.jpg']").click
    	b = find("a[class='btn btn-primary'").text 
    	click_on "#{Date.current}"
    	find("input[type='checkbox']").set(true)
    	click_on "Buy"
    	click_on "Next"
    	assert_text "Select Beverage"
    	a = first("label").text 
    	first("input[type='number']").set(1) 
    	click_on "Buy"
    	click_on "Confirm order"
    	click_on "Inventory"
    	assert_text "tester tester's Inventory"
    	assert_text "Eternals"
    	assert_text "DateTime : #{b}"
    	assert_text "#{a}"
    	assert_text "Chair : A1"
    	if (a.eql?("Salt Popcorn")) 
      		assert_text "Beverage"
      		assert_text "Name : Salt Popcorn"
      		assert_text "Quantity : 1"
      		assert_text "Price : 150"
    	else 
      		assert_text "Beverage"
      		assert_text "Name : MyString"
      		assert_text "Quantity : 1"
      		assert_text "Price : 1"
    	end
    	
  	end
end


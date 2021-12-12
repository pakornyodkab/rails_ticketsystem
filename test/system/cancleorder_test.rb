require "application_system_test_case"
class CancleOrderTest < ApplicationSystemTestCase
  setup do
    @user = users(:u1)
  end

  test "cancleorderline" do
    visit main_url
    fill_in "Username",with: @user.username
    fill_in "Password",with: 123456
    click_on "Login"
    find("img[src='https://cdn.majorcineplex.com/uploads/movie/2771/thumb_2771.jpg']").click
    click_on "#{Date.current}"
    find("input[type='checkbox']").set(true)
    click_on "Buy"
    assert_text "Ticket Order"
    assert_text "Movie : Eternals"
    assert_text "Chair : A1"
    assert_text "Total Price : 250 THB"
    click_on "X"
    assert_text "Total Price : 0 THB"

  end 

  test "cancleorder" do
    visit main_url
    fill_in "Username",with: @user.username
    fill_in "Password",with: 123456
    click_on "Login"
    find("img[src='https://cdn.majorcineplex.com/uploads/movie/2771/thumb_2771.jpg']").click
    click_on "#{Date.current}"
    find("input[type='checkbox']").set(true)
    click_on "Buy"
    assert_text "Ticket Order"
    assert_text "Movie : Eternals"
    assert_text "Chair : A1"
    assert_text "Total Price : 250 THB"
    click_on "Cancle order"
    assert_text "Cancle order already"
  end

end
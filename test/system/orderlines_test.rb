require "application_system_test_case"

class OrderlinesTest < ApplicationSystemTestCase
  setup do
    @orderline = orderlines(:one)
  end

  test "visiting the index" do
    visit orderlines_url
    assert_selector "h1", text: "Orderlines"
  end

  test "creating a Orderline" do
    visit orderlines_url
    click_on "New Orderline"

    fill_in "Order", with: @orderline.order_id
    fill_in "Price", with: @orderline.price
    fill_in "Product", with: @orderline.product_id
    fill_in "Quantity", with: @orderline.quantity
    click_on "Create Orderline"

    assert_text "Orderline was successfully created"
    click_on "Back"
  end

  test "updating a Orderline" do
    visit orderlines_url
    click_on "Edit", match: :first

    fill_in "Order", with: @orderline.order_id
    fill_in "Price", with: @orderline.price
    fill_in "Product", with: @orderline.product_id
    fill_in "Quantity", with: @orderline.quantity
    click_on "Update Orderline"

    assert_text "Orderline was successfully updated"
    click_on "Back"
  end

  test "destroying a Orderline" do
    visit orderlines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orderline was successfully destroyed"
  end
end

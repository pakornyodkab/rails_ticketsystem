require "test_helper"

class OrderlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orderline = orderlines(:one)
  end

  test "should get index" do
    get orderlines_url
    assert_response :success
  end

  test "should get new" do
    get new_orderline_url
    assert_response :success
  end

  test "should create orderline" do
    assert_difference('Orderline.count') do
      post orderlines_url, params: { orderline: { order_id: @orderline.order_id, price: @orderline.price, product_id: @orderline.product_id, quantity: @orderline.quantity } }
    end

    assert_redirected_to orderline_url(Orderline.last)
  end

  test "should show orderline" do
    get orderline_url(@orderline)
    assert_response :success
  end

  test "should get edit" do
    get edit_orderline_url(@orderline)
    assert_response :success
  end

  test "should update orderline" do
    patch orderline_url(@orderline), params: { orderline: { order_id: @orderline.order_id, price: @orderline.price, product_id: @orderline.product_id, quantity: @orderline.quantity } }
    assert_redirected_to orderline_url(@orderline)
  end

  test "should destroy orderline" do
    assert_difference('Orderline.count', -1) do
      delete orderline_url(@orderline)
    end

    assert_redirected_to orderlines_url
  end
end

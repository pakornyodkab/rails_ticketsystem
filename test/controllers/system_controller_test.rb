require "test_helper"

class SystemControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get system_main_url
    assert_response :success
  end
end

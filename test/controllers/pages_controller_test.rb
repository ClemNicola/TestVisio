require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get dashboard" do
    get pages_dashboard_url
    assert_response :success
  end

  test "should get users" do
    get pages_users_url
    assert_response :success
  end

  test "should get advisors" do
    get pages_advisors_url
    assert_response :success
  end
end

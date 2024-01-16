require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get advisors" do
    get users_advisors_url
    assert_response :success
  end
end

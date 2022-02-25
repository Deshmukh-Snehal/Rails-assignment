require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get dashbord" do
    get home_dashbord_url
    assert_response :success
  end

end

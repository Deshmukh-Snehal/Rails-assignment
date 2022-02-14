require 'test_helper'

class PlayerdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @playerdetail = playerdetails(:one)
  end

  test "should get index" do
    get playerdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_playerdetail_url
    assert_response :success
  end

  test "should create playerdetail" do
    assert_difference('Playerdetail.count') do
      post playerdetails_url, params: { playerdetail: { country: @playerdetail.country, email: @playerdetail.email, gender: @playerdetail.gender, mobile_no: @playerdetail.mobile_no, name: @playerdetail.name, state: @playerdetail.state } }
    end

    assert_redirected_to playerdetail_url(Playerdetail.last)
  end

  test "should show playerdetail" do
    get playerdetail_url(@playerdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_playerdetail_url(@playerdetail)
    assert_response :success
  end

  test "should update playerdetail" do
    patch playerdetail_url(@playerdetail), params: { playerdetail: { country: @playerdetail.country, email: @playerdetail.email, gender: @playerdetail.gender, mobile_no: @playerdetail.mobile_no, name: @playerdetail.name, state: @playerdetail.state } }
    assert_redirected_to playerdetail_url(@playerdetail)
  end

  test "should destroy playerdetail" do
    assert_difference('Playerdetail.count', -1) do
      delete playerdetail_url(@playerdetail)
    end

    assert_redirected_to playerdetails_url
  end
end

require 'test_helper'

class AnnocementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annocement = annocements(:one)
  end

  test "should get index" do
    get annocements_url
    assert_response :success
  end

  test "should get new" do
    get new_annocement_url
    assert_response :success
  end

  test "should create annocement" do
    assert_difference('Annocement.count') do
      post annocements_url, params: { annocement: { title: @annocement.title } }
    end

    assert_redirected_to annocement_url(Annocement.last)
  end

  test "should show annocement" do
    get annocement_url(@annocement)
    assert_response :success
  end

  test "should get edit" do
    get edit_annocement_url(@annocement)
    assert_response :success
  end

  test "should update annocement" do
    patch annocement_url(@annocement), params: { annocement: { title: @annocement.title } }
    assert_redirected_to annocement_url(@annocement)
  end

  test "should destroy annocement" do
    assert_difference('Annocement.count', -1) do
      delete annocement_url(@annocement)
    end

    assert_redirected_to annocements_url
  end
end

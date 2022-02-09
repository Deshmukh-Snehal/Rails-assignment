require 'test_helper'

class TagInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_info = tag_infos(:one)
  end

  test "should get index" do
    get tag_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_info_url
    assert_response :success
  end

  test "should create tag_info" do
    assert_difference('TagInfo.count') do
      post tag_infos_url, params: { tag_info: { player: @tag_info.player, post: @tag_info.post, title: @tag_info.title } }
    end

    assert_redirected_to tag_info_url(TagInfo.last)
  end

  test "should show tag_info" do
    get tag_info_url(@tag_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_info_url(@tag_info)
    assert_response :success
  end

  test "should update tag_info" do
    patch tag_info_url(@tag_info), params: { tag_info: { player: @tag_info.player, post: @tag_info.post, title: @tag_info.title } }
    assert_redirected_to tag_info_url(@tag_info)
  end

  test "should destroy tag_info" do
    assert_difference('TagInfo.count', -1) do
      delete tag_info_url(@tag_info)
    end

    assert_redirected_to tag_infos_url
  end
end

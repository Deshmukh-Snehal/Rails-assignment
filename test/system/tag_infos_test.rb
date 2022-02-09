require "application_system_test_case"

class TagInfosTest < ApplicationSystemTestCase
  setup do
    @tag_info = tag_infos(:one)
  end

  test "visiting the index" do
    visit tag_infos_url
    assert_selector "h1", text: "Tag Infos"
  end

  test "creating a Tag info" do
    visit tag_infos_url
    click_on "New Tag Info"

    fill_in "Player", with: @tag_info.player
    fill_in "Post", with: @tag_info.post
    fill_in "Title", with: @tag_info.title
    click_on "Create Tag info"

    assert_text "Tag info was successfully created"
    click_on "Back"
  end

  test "updating a Tag info" do
    visit tag_infos_url
    click_on "Edit", match: :first

    fill_in "Player", with: @tag_info.player
    fill_in "Post", with: @tag_info.post
    fill_in "Title", with: @tag_info.title
    click_on "Update Tag info"

    assert_text "Tag info was successfully updated"
    click_on "Back"
  end

  test "destroying a Tag info" do
    visit tag_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag info was successfully destroyed"
  end
end

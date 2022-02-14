require "application_system_test_case"

class AnnocementsTest < ApplicationSystemTestCase
  setup do
    @annocement = annocements(:one)
  end

  test "visiting the index" do
    visit annocements_url
    assert_selector "h1", text: "Annocements"
  end

  test "creating a Annocement" do
    visit annocements_url
    click_on "New Annocement"

    fill_in "Title", with: @annocement.title
    click_on "Create Annocement"

    assert_text "Annocement was successfully created"
    click_on "Back"
  end

  test "updating a Annocement" do
    visit annocements_url
    click_on "Edit", match: :first

    fill_in "Title", with: @annocement.title
    click_on "Update Annocement"

    assert_text "Annocement was successfully updated"
    click_on "Back"
  end

  test "destroying a Annocement" do
    visit annocements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Annocement was successfully destroyed"
  end
end

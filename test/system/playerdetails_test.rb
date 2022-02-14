require "application_system_test_case"

class PlayerdetailsTest < ApplicationSystemTestCase
  setup do
    @playerdetail = playerdetails(:one)
  end

  test "visiting the index" do
    visit playerdetails_url
    assert_selector "h1", text: "Playerdetails"
  end

  test "creating a Playerdetail" do
    visit playerdetails_url
    click_on "New Playerdetail"

    fill_in "Country", with: @playerdetail.country
    fill_in "Email", with: @playerdetail.email
    fill_in "Gender", with: @playerdetail.gender
    fill_in "Mobile no", with: @playerdetail.mobile_no
    fill_in "Name", with: @playerdetail.name
    fill_in "State", with: @playerdetail.state
    click_on "Create Playerdetail"

    assert_text "Playerdetail was successfully created"
    click_on "Back"
  end

  test "updating a Playerdetail" do
    visit playerdetails_url
    click_on "Edit", match: :first

    fill_in "Country", with: @playerdetail.country
    fill_in "Email", with: @playerdetail.email
    fill_in "Gender", with: @playerdetail.gender
    fill_in "Mobile no", with: @playerdetail.mobile_no
    fill_in "Name", with: @playerdetail.name
    fill_in "State", with: @playerdetail.state
    click_on "Update Playerdetail"

    assert_text "Playerdetail was successfully updated"
    click_on "Back"
  end

  test "destroying a Playerdetail" do
    visit playerdetails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Playerdetail was successfully destroyed"
  end
end

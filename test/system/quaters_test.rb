require "application_system_test_case"

class QuatersTest < ApplicationSystemTestCase
  setup do
    @quater = quaters(:one)
  end

  test "visiting the index" do
    visit quaters_url
    assert_selector "h1", text: "Quaters"
  end

  test "creating a Quater" do
    visit quaters_url
    click_on "New Quater"

    fill_in "Name", with: @quater.name
    click_on "Create Quater"

    assert_text "Quater was successfully created"
    click_on "Back"
  end

  test "updating a Quater" do
    visit quaters_url
    click_on "Edit", match: :first

    fill_in "Name", with: @quater.name
    click_on "Update Quater"

    assert_text "Quater was successfully updated"
    click_on "Back"
  end

  test "destroying a Quater" do
    visit quaters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quater was successfully destroyed"
  end
end

require "application_system_test_case"

class InitiativesTest < ApplicationSystemTestCase
  setup do
    @initiative = initiatives(:one)
  end

  test "visiting the index" do
    visit initiatives_url
    assert_selector "h1", text: "Initiatives"
  end

  test "creating a Initiative" do
    visit initiatives_url
    click_on "New Initiative"

    fill_in "Description", with: @initiative.description
    fill_in "Name", with: @initiative.name
    fill_in "Roadmap", with: @initiative.roadmap_id
    click_on "Create Initiative"

    assert_text "Initiative was successfully created"
    click_on "Back"
  end

  test "updating a Initiative" do
    visit initiatives_url
    click_on "Edit", match: :first

    fill_in "Description", with: @initiative.description
    fill_in "Name", with: @initiative.name
    fill_in "Roadmap", with: @initiative.roadmap_id
    click_on "Update Initiative"

    assert_text "Initiative was successfully updated"
    click_on "Back"
  end

  test "destroying a Initiative" do
    visit initiatives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Initiative was successfully destroyed"
  end
end

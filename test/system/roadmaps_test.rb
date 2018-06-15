require "application_system_test_case"

class RoadmapsTest < ApplicationSystemTestCase
  setup do
    @roadmap = roadmaps(:one)
  end

  test "visiting the index" do
    visit roadmaps_url
    assert_selector "h1", text: "Roadmaps"
  end

  test "creating a Roadmap" do
    visit roadmaps_url
    click_on "New Roadmap"

    fill_in "Description", with: @roadmap.description
    fill_in "Name", with: @roadmap.name
    click_on "Create Roadmap"

    assert_text "Roadmap was successfully created"
    click_on "Back"
  end

  test "updating a Roadmap" do
    visit roadmaps_url
    click_on "Edit", match: :first

    fill_in "Description", with: @roadmap.description
    fill_in "Name", with: @roadmap.name
    click_on "Update Roadmap"

    assert_text "Roadmap was successfully updated"
    click_on "Back"
  end

  test "destroying a Roadmap" do
    visit roadmaps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Roadmap was successfully destroyed"
  end
end

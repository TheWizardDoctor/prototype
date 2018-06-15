require 'test_helper'

class RoadmapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roadmap = roadmaps(:one)
  end

  test "should get index" do
    get roadmaps_url
    assert_response :success
  end

  test "should get new" do
    get new_roadmap_url
    assert_response :success
  end

  test "should create roadmap" do
    assert_difference('Roadmap.count') do
      post roadmaps_url, params: { roadmap: { description: @roadmap.description, name: @roadmap.name } }
    end

    assert_redirected_to roadmap_url(Roadmap.last)
  end

  test "should show roadmap" do
    get roadmap_url(@roadmap)
    assert_response :success
  end

  test "should get edit" do
    get edit_roadmap_url(@roadmap)
    assert_response :success
  end

  test "should update roadmap" do
    patch roadmap_url(@roadmap), params: { roadmap: { description: @roadmap.description, name: @roadmap.name } }
    assert_redirected_to roadmap_url(@roadmap)
  end

  test "should destroy roadmap" do
    assert_difference('Roadmap.count', -1) do
      delete roadmap_url(@roadmap)
    end

    assert_redirected_to roadmaps_url
  end
end

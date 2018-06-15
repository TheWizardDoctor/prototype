require 'test_helper'

class QuatersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quater = quaters(:one)
  end

  test "should get index" do
    get quaters_url
    assert_response :success
  end

  test "should get new" do
    get new_quater_url
    assert_response :success
  end

  test "should create quater" do
    assert_difference('Quater.count') do
      post quaters_url, params: { quater: { name: @quater.name } }
    end

    assert_redirected_to quater_url(Quater.last)
  end

  test "should show quater" do
    get quater_url(@quater)
    assert_response :success
  end

  test "should get edit" do
    get edit_quater_url(@quater)
    assert_response :success
  end

  test "should update quater" do
    patch quater_url(@quater), params: { quater: { name: @quater.name } }
    assert_redirected_to quater_url(@quater)
  end

  test "should destroy quater" do
    assert_difference('Quater.count', -1) do
      delete quater_url(@quater)
    end

    assert_redirected_to quaters_url
  end
end

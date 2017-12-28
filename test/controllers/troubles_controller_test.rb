require 'test_helper'

class TroublesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trouble = troubles(:one)
  end

  test "should get index" do
    get troubles_url
    assert_response :success
  end

  test "should get new" do
    get new_trouble_url
    assert_response :success
  end

  test "should create trouble" do
    assert_difference('Trouble.count') do
      post troubles_url, params: { trouble: { is_active: @trouble.is_active, trouble_name: @trouble.trouble_name } }
    end

    assert_redirected_to trouble_url(Trouble.last)
  end

  test "should show trouble" do
    get trouble_url(@trouble)
    assert_response :success
  end

  test "should get edit" do
    get edit_trouble_url(@trouble)
    assert_response :success
  end

  test "should update trouble" do
    patch trouble_url(@trouble), params: { trouble: { is_active: @trouble.is_active, trouble_name: @trouble.trouble_name } }
    assert_redirected_to trouble_url(@trouble)
  end

  test "should destroy trouble" do
    assert_difference('Trouble.count', -1) do
      delete trouble_url(@trouble)
    end

    assert_redirected_to troubles_url
  end
end

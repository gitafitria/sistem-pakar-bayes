require 'test_helper'

class IndicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @indication = indications(:one)
  end

  test "should get index" do
    get indications_url
    assert_response :success
  end

  test "should get new" do
    get new_indication_url
    assert_response :success
  end

  test "should create indication" do
    assert_difference('Indication.count') do
      post indications_url, params: { indication: { indication_name: @indication.indication_name, is_active: @indication.is_active } }
    end

    assert_redirected_to indication_url(Indication.last)
  end

  test "should show indication" do
    get indication_url(@indication)
    assert_response :success
  end

  test "should get edit" do
    get edit_indication_url(@indication)
    assert_response :success
  end

  test "should update indication" do
    patch indication_url(@indication), params: { indication: { indication_name: @indication.indication_name, is_active: @indication.is_active } }
    assert_redirected_to indication_url(@indication)
  end

  test "should destroy indication" do
    assert_difference('Indication.count', -1) do
      delete indication_url(@indication)
    end

    assert_redirected_to indications_url
  end
end

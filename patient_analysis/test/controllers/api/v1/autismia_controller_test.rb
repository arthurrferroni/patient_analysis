require "test_helper"

class Api::V1::AutismiaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_autismia_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_autismia_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_autismia_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_autismia_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_autismia_destroy_url
    assert_response :success
  end
end

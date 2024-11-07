require "test_helper"

class Api::V1::SupervisorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_supervisor_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_supervisor_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_supervisor_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_supervisor_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_supervisor_destroy_url
    assert_response :success
  end
end

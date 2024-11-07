require "test_helper"

class Api::V1::ReuniaoFamiliarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_reuniao_familiar_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_reuniao_familiar_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_reuniao_familiar_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_reuniao_familiar_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_reuniao_familiar_destroy_url
    assert_response :success
  end
end

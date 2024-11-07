require "test_helper"

class Api::V1::FeedbackEscolaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_feedback_escola_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_feedback_escola_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_feedback_escola_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_feedback_escola_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_feedback_escola_destroy_url
    assert_response :success
  end
end

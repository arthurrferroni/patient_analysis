require "test_helper"

class Api::V1::AuditoriaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_auditoria_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_auditoria_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_auditoria_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_auditoria_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_auditoria_destroy_url
    assert_response :success
  end
end

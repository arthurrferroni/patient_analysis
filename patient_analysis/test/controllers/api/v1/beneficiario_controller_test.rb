require "test_helper"

class Api::V1::BeneficiarioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_beneficiario_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_beneficiario_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_beneficiario_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_beneficiario_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_beneficiario_destroy_url
    assert_response :success
  end
end

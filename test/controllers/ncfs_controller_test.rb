require "test_helper"

class NcfsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ncfs_new_url
    assert_response :success
  end

  test "should get index" do
    get ncfs_index_url
    assert_response :success
  end

  test "should get create" do
    get ncfs_create_url
    assert_response :success
  end

  test "should get update" do
    get ncfs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ncfs_destroy_url
    assert_response :success
  end
end

require 'test_helper'

class Admin::RolesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_roles_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_roles_create_url
    assert_response :success
  end

  test "should get index" do
    get admin_roles_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_roles_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_roles_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_roles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_roles_destroy_url
    assert_response :success
  end

end

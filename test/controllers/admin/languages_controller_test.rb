require 'test_helper'

class Admin::LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_languages_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_languages_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_languages_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_languages_update_url
    assert_response :success
  end

  test "should get index" do
    get admin_languages_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_languages_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_languages_destroy_url
    assert_response :success
  end

end

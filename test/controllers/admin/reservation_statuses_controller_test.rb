require 'test_helper'

class Admin::ReservationStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_reservation_statuses_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_reservation_statuses_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_reservation_statuses_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_reservation_statuses_update_url
    assert_response :success
  end

  test "should get index" do
    get admin_reservation_statuses_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_reservation_statuses_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_reservation_statuses_destroy_url
    assert_response :success
  end

end

require 'test_helper'

class CarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_index_url
    assert_response :success
  end

  test "should get new" do
    get car_new_url
    assert_response :success
  end

  test "should get create" do
    get car_create_url
    assert_response :success
  end

  test "should get listing" do
    get car_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get car_pricing_url
    assert_response :success
  end

  test "should get description" do
    get car_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get car_photo_upload_url
    assert_response :success
  end

  test "should get amenities" do
    get car_amenities_url
    assert_response :success
  end

  test "should get update" do
    get car_update_url
    assert_response :success
  end

end

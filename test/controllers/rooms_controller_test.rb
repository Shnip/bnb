require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @room = rooms(:one)
  end

 # NOT LOGGED IN
  test "should not get index when not logged in" do
    get rooms_url
    assert_redirected_to login_url
  end

  test "should not get show when not logged in" do
    get room_path(@room)
    assert_response :success
  end

  test "should not get new when not logged in" do
    get new_room_path
    assert_redirected_to login_url
  end

  test "should not get create when not logged in" do

    assert_no_difference "Room.count" do
      post rooms_url, params: { room: { home_type: "Apartment",
                                        room_type: "Private",    accommodate: 1, bed_room: 1, bath_room: 1, listing_name: "The best place", summary: "The best place", address: "LA", is_tv: true, is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true, user_id: @user.id }}
    end
    assert_redirected_to login_url
  end

  test "should not get edit when not logged in" do
    get edit_room_path(@room)
    assert_redirected_to login_url
  end

  test "should not get update when not logged in" do
    patch room_path(@room)
    assert_redirected_to login_url
  end

  test "should not get destroy when not logged in" do
    delete room_path(@room)
    assert_redirected_to login_url
  end

# WHEN LOGGED IN
  test "should get index when logged in" do
    login_user(@user)
    get rooms_url
    assert_response :success
  end

  test "should get show when logged in" do
    login_user(@user)
    get room_path(@room)
    assert_response :success
  end

  test "should get new when logged in" do
    login_user(@user)
    get new_room_path
    assert_response :success
  end

  test "should create room when logged in" do
    login_user(@user)
    assert_difference "Room.count", +1 do
      post rooms_url, params: { room: {home_type: "Apartment",
                                room_type: "Private",    accommodate: 1, bed_room: 1, bath_room: 1, listing_name: "The best place", summary: "The best place", address: "LA", is_tv: true, is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true, user_id: @user.id} }
    end
    assert_redirected_to room_path(@user.rooms.last)
  end

  test "should get edit when logged in" do
    login_user(@user)
    get edit_room_path(@room)
    assert_response :success
  end

  test "should update room when logged in" do
    login_user(@user)

    patch room_path(@room), params: { room: {home_type: "Apartment",
                                      room_type: "Private", accommodate: 2, bed_room: 2, bath_room: 2,
                                      listing_name: "The best place",
                                      summary: "The best place",
                                      address: "LA", is_tv: true,
                                      is_kitchen: true, is_air: true, is_heating: true, is_internet: true, price: 200, active: true, user_id: @user.id} }

    assert_redirected_to @room
  end

  # test "should get destroy when logged in" do
  #   login_user(@user)
  #   delete room_path(@room)
  #   assert_response :success
  # end
end

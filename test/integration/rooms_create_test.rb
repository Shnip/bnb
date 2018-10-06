require 'test_helper'

class RoomsCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    login_user(@user)
  end

  test "should create room with valid information" do
    get new_room_path
    assert_template "rooms/new"
    assert_select ".card-header", text: "Create your beautiful place"
    assert_select 'select', count: 5
    assert_select 'input.form-check-input', count: 6
    assert_select 'input.form-control', count: 3
    assert_select 'textarea', count: 1

    assert_difference "Room.count", +1 do
      post rooms_url, params: { room: { home_type: "Apartment",
                                        room_type: "Private",
                                        accommodate: 1, bed_room: 1,
                                        bath_room: 1,
                                        listing_name: "The best place", summary: "The best place",
                                        address: "LA", is_tv: true,
                                        is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true,
                                        user_id: @user.id} }
    end

    assert_equal @user.rooms.count, 3
    assert_redirected_to @user.rooms.last
  end

  test "should not create with invalid information" do
    get new_room_path
    assert_template "rooms/new"

    assert_no_difference "Room.count" do
      post rooms_url, params: { room: { home_type: "",
                                        room_type: "",
                                        accommodate: 1, bed_room: 1,
                                        bath_room: 0,
                                        listing_name: "", summary: "",
                                        address: "", is_tv: true,
                                        is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true,
                                        user_id: @user.id} }
    end

    assert_equal @user.rooms.count, 2
    assert_template "rooms/new"
  end

  test "should create room with photo" do
    assert_difference "@user.rooms.count", +1 do
      post rooms_url, params: { room: { home_type: "Apartment",
                                        room_type: "Private",
                                        accommodate: 1, bed_room: 1,
                                        bath_room: 1,
                                        listing_name: "The best place", summary: "The best place",
                                        address: "LA", is_tv: true,
                                        is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true,
                                        user_id: @user.id},
                images: [fixture_file_upload('files/original.jpg')] }
    end

    assert_equal @user.rooms.count, 3
    assert_equal @user.rooms.last.photos.count, 1
  end

end

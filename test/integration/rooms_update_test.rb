require 'test_helper'

class RoomsUpdateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @room = rooms(:one)
    @another_user = users(:two)
    @another_user.activate
  end

  test "should update room with valid information" do
    login_user(@user)
    get edit_room_path(@room)
    assert_template "rooms/edit"
    assert_select ".card-header", text: "Edit your place"
    assert_select 'select', count: 5
    assert_select 'input.form-check-input', count: 6
    assert_select 'input.form-control', count: 3
    assert_select 'textarea', count: 1

    patch room_path(@room), params: { room: { home_type: "Apartment",
                                      room_type: "Private",
                                      accommodate: 1, bed_room: 1,
                                      bath_room: 1,
                                      listing_name: "The best place", summary: "The best place",
                                      address: "LA", is_tv: true,
                                      is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true,
                                      user_id: @user.id} }

    assert_redirected_to @room
    follow_redirect!
    assert_template "rooms/show"

    @room.reload
    assert_equal @room.home_type, "Apartment"
    assert_equal @room.listing_name, "The best place"
  end

  test "should not update room with invalid information" do
    login_user(@user)
    get edit_room_path(@room)
    assert_template "rooms/edit"

    patch room_path(@room), params: { room: { home_type: "Apartment",
                                      room_type: "",
                                      accommodate: 1, bed_room: 1,
                                      bath_room: 1,
                                      listing_name: "", summary: "",
                                      address: "", is_tv: true,
                                      is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true,
                                      user_id: @user.id} }

    @room.reload
    assert_not_equal @room.home_type, "Apartment"
    assert_equal @room.listing_name, "MyString"

    assert_template "rooms/edit"
  end

  test "should not update the room owned by another user" do
    login_user(@another_user)
    patch room_path(@room), params: { room: { home_type: "Apartment",
                                      room_type: "",
                                      accommodate: 1, bed_room: 1,
                                      bath_room: 1,
                                      listing_name: "", summary: "",
                                      address: "", is_tv: true,
                                      is_kitchen: false, is_air: false, is_heating: true, is_internet: true, price: 200, active: true,
                                      user_id: @another_user.id} }

    assert_redirected_to root_path
    assert_not flash[:danger].blank?
    follow_redirect!
    assert_select '.alert-danger', text: "You haven't permission"
  end

end

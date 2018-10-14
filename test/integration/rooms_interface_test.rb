require 'test_helper'

class RoomsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    login_user(@user)
    @room = rooms(:three)
  end

  test "room interface" do
    get room_path(@room)
    assert_template "rooms/show"
    assert_select "img.img-fluid", count: 2
    assert_select "img.rounded-circle", count: 2
    assert_select "#carouselExampleIndicators"
    assert_select "#carouselExampleIndicators img", count: @room.photos.count
    assert_select "form#new_reservation", count: 1
  end
end

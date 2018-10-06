require 'test_helper'

class RoomsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    login_user(@user)
  end

  test "should show only user rooms" do
    get rooms_path
    assert_template "rooms/index"
    assert_select ".card-header", text: "Listings"
    assert_not_equal Room.count, @user.rooms.count
    assert_select ".card-body > .row", count: 2
    assert_select "a.btn-fox", count: 2, text: "Update"
  end
end

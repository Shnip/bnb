require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:two)
    login_user(@user)
    @room = rooms(:one)
  end

  test "should create reservation with valid date" do
    assert_difference "Reservation.count", +1 do
      post room_reservations_path(@room), params: {reservation:{ start_date: "2018-10-06", end_date: "2018-10-07", room_id: @room.id, price: @room.price, total: 400 }}
    end

    assert_redirected_to @room
    assert_not flash[:success].blank?
  end

  test "should not create a reservation when the date matches the date booked " do
    assert_no_difference "Reservation.count" do
      post room_reservations_path(@room), params: {reservation:{ start_date: "2018-10-03", end_date: "2018-10-07", room_id: @room.id, price: @room.price, total: 400 }}
    end
    assert_not flash[:danger].blank?
    assert_template 'rooms/show'
  end
end

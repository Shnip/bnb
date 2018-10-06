class ReservationsController < ApplicationController

  def create
    unless is_conflict(reservation_params[:start_date], reservation_params[:end_date])
      @reservation = current_user.reservations.create(reservation_params)

      redirect_to( @reservation.room, flash: {success: "Your reservation has been created!"})
    else
      @room = Room.find(params[:room_id])
      flash.now[:danger] = "This date range is not available"
      render 'rooms/show'
    end
  end

  def preload
    room = Room.find(params[:room_id])

    today = Date.today
    reservations = room.reservations.select('id, start_date, end_date').where("start_date >= ? OR end_date >= ?", today, today)

    respond_to do |format|
      format.json{ render json: reservations }
    end
  end

  def check_conflict
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {conflict: is_conflict(start_date, end_date)}

    respond_to do |format|
      format.json { render json: output }
    end
  end

  private

  def is_conflict(start_date, end_date)
    room = Room.find(params[:room_id])

    check = room.reservations.where("? < start_date AND ? > end_date", start_date, end_date).or(room.reservations.where("? BETWEEN start_date AND end_date ", start_date)).or(room.reservations.where("? BETWEEN start_date AND end_date", end_date))

    !check.blank?
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total, :price, :room_id)
  end
end

class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def home
    @rooms = Room.where(active: true).joins(:photos).limit(8).distinct("room.id")
  end

  def search

    unless params[:search].blank?
      session[:loc_search] = params[:search]
    else
      session[:loc_search] = ""
    end

    unless session[:loc_search].blank?
      @room_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @room_address = Room.where(active: true)
    end

    @search = @room_address.ransack(params[:q])
    rooms = @search.result

    @arrRooms = rooms.to_a

    if (params[:start_date] && params[:end_date] && !params[:start_date].blank? && !params[:end_date].blank?)
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      rooms.each do |room|

        check = room.reservations.where("? < start_date AND ? > end_date", start_date, end_date).or(room.reservations.where("? BETWEEN start_date AND end_date ", start_date)).or(room.reservations.where("? BETWEEN start_date AND end_date", end_date)).limit(1)

        @arrRooms.delete(room) unless check.blank?
      end

    end
  end

end

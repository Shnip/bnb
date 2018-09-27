class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :require_login, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      flash[:success] = "Successfully created..."
      redirect_to @room
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      flash[:success] = "Successfully updated..."
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate,
                                  :bed_room, :bath_room, :listing_name,
                                  :summary, :address, :is_tv, :is_kitchen,
                                  :is_air, :is_internet, :is_heating, :price,
                                                                      :active)
  end
end

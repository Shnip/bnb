class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :require_login, except: [:show]
  before_action :correct_room?, only: [:edit, :update, :destroy]

  def index
    @rooms = current_user.rooms
  end

  def show
    @photos = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      flash[:success] = "Successfully created..."
      redirect_to @room
    else
      render :new
    end

    respond_to do |format|
      format.html {

      }
      format.json { render json: @resource }
    end
  end

  def edit
    @photos = @room.photos
  end

  def update
    if @room.update(room_params)
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
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

  def correct_room?
    redirect_to(root_path, flash: {danger: "You haven't permission"}) unless current_user.id == @room.user_id
  end
end
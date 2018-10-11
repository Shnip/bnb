class ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.create(review_params)
    @reviews = Room.find(review_params[:room_id]).reviews
    @room = Room.find(review_params[:room_id])

    respond_to do |format|
      format.html {  redirect_to @review.room }
      format.js
    end
  end

  def destroy
    @review = Review.find(params[:id])
    room = @review.room
    @review.destroy

    redirect_to room
  end

  private

  def review_params
    params.require(:review).permit(:comment, :star, :room_id)
  end
end

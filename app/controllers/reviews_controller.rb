class ReviewsController < ApplicationController
  before_action :set_list, only: %i[new create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = @list.reviews.new(review_params) #@list.reviews setea el list_id, y con  los params le pasamos "comment"
    if @review.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end

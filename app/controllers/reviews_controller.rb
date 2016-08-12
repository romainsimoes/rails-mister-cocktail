class ReviewsController < ApplicationController
  before_action :find_cocktail, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = @cocktail.reviews.build(review_params)
    @review.save
    redirect_to cocktail_path(@cocktail)
  end

  def update
    @review.update(review_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @review.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

    def find_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:content, :rating, :cocktail_id)
    end
end

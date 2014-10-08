class BookReviewsController < ApplicationController
  def new
    @book_review = BookReview.new
  end

  def create
    @book_review = BookReview.new(book_review_params)
    if @book_review.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @book_review = BookReview.friendly.find(params[:id])
  end

  def edit
    @book_review = BookReview.find(params[:id])
  end

  def update
    @book_review = BookReview.find(params[:id])
    if @book_review.update(book_review_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def book_review_params
    params.require(:book_review).permit(:name, :subtitle, :review_text, :image)
  end
end
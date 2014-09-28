class AddImageToBookReview < ActiveRecord::Migration
  def change
    add_attachment :book_reviews, :image
  end
end

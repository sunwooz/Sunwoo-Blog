class AddBookReviewModel < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.string :name
      t.string :subtitle
      t.text :review_text
    end
  end
end

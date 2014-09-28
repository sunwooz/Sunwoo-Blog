class AddBodyHtmlToBookReview < ActiveRecord::Migration
  def change
    add_column :book_reviews, :body_html, :text
  end
end

class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    add_column :book_reviews, :slug, :string
    add_index :posts, :slug
    add_index :book_reviews, :slug
  end
end

class AddShortToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :short, :text
  end
end

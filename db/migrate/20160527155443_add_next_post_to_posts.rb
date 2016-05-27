class AddNextPostToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :next_post, :integer
  end
end

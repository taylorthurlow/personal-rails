class RemoveTagLineFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :tag_line
  end
end

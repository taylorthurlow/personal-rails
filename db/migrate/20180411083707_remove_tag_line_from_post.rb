class RemoveTagLineFromPost < ActiveRecord::Migration[4.2]
  def change
    remove_column :posts, :tag_line
  end
end

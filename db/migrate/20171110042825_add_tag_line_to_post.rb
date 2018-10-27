class AddTagLineToPost < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :tag_line, :string
  end
end

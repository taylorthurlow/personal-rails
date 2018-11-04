class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :tag, foreign_key: true
      t.add_index :tag_posts, [:tag_id, :post_id], unique: true

      t.timestamps
    end
  end
end

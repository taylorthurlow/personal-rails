class AddLastUpdatedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :last_updated, :date
  end
end

class CreateLogins < ActiveRecord::Migration[4.2]
  def change
    create_table :logins do |t|
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

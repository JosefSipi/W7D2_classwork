class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, presense: true, null: false, unique: true
      t.string :password_digest, presense: true, null: false
      t.string :session_token, presense: true, null: false, unique: true

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :session_token
  end
end

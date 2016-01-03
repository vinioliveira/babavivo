class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name,               null: false
      t.string :position
      t.integer :number_shirt
      t.string :email,              null: false, default: ""
      t.string :avatar
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end

    add_index :users, :provider, unique: true
    add_index :users, :uid, unique: true
  end
end

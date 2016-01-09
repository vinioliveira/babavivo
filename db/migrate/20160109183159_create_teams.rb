class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :color
      t.string :name
      t.references :players

      t.timestamps null: false
    end
  end
end

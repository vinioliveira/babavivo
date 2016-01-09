class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.integer :points,        default: 0
      t.integer :wins,          default: 0
      t.integer :loss,          default: 0
      t.integer :drawn,         default: 0
      t.integer :average,       default: 0
      t.integer :matchs,        default: 0
      t.integer :position,      default: 0
      t.integer :last_position, default: 0

      t.references :player

      t.timestamps null: false
    end
    add_index :standings, :player_id
  end
end

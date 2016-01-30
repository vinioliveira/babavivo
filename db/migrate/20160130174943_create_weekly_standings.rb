class CreateWeeklyStandings < ActiveRecord::Migration
  def change
    create_table :weekly_standings do |t|
      t.integer :points,        default: 0
      t.integer :wins,          default: 0
      t.integer :loss,          default: 0
      t.integer :drawn,         default: 0
      t.integer :average,       default: 0
      t.integer :matchs,        default: 0
      t.integer :position,      default: 0
      t.integer :last_position, default: 0

      t.timestamps null: false
    end
  end
end

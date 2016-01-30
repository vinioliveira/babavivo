class RemoveStadingFieldsFromWeeklyStading < ActiveRecord::Migration
  def change
    remove_column :weekly_standings, :points
    remove_column :weekly_standings, :wins
    remove_column :weekly_standings, :loss
    remove_column :weekly_standings, :drawn
    remove_column :weekly_standings, :average
    remove_column :weekly_standings, :matchs
    remove_column :weekly_standings, :position
    remove_column :weekly_standings, :last_position
  end
end

class AddRoundFieldToWeeklyStanding < ActiveRecord::Migration
  def change
    add_column :weekly_standings, :round, :integer
    add_column :weekly_standings, :season, :integer
  end
end

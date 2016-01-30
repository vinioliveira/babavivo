class AddingWeeklyStadingFieldToStandings < ActiveRecord::Migration
  def change
    add_column :standings, :weekly_standing_id, :integer
  end
end

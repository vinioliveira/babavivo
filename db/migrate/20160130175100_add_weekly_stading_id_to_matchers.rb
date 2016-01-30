class AddWeeklyStadingIdToMatchers < ActiveRecord::Migration
  def change
    add_column :matches, :weekly_standing_id, :integer
  end
end

class AddFinshedDateToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :ends_at, :timestamp
  end
end

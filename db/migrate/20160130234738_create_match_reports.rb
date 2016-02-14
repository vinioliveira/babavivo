class CreateMatchReports < ActiveRecord::Migration
  def change
    create_table :match_reports do |t|
      t.references :player, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true
      t.integer :report, default: 0
      t.timestamps null: false
    end
  end
end

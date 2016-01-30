class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :first_team_id
      t.integer :second_team_id
      t.integer :first_team_score
      t.integer :second_team_score

      t.timestamps null: false
    end

    add_index :matches, :first_team_id
    add_foreign_key :matches, :teams, column: :first_team_id
    add_index :matches, :second_team_id
    add_foreign_key :matches, :teams, column: :second_team_id
  end
end

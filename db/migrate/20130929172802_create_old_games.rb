class CreateOldGames < ActiveRecord::Migration
  def change
    create_table :old_games do |t|
      t.integer :game_id

      t.timestamps
    end
  end
end

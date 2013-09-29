class AddOldGameIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :old_game_id, :integer

  end
end

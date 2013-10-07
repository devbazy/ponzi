class AddRoundsToGames < ActiveRecord::Migration
  def change
    add_column :games, :rounds, :integer

  end
end

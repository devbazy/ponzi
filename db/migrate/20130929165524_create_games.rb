class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :players_no
      t.integer :winners_no
      t.boolean :open
      t.integer :seed
      t.integer :owner_id
      t.float :cost

      t.timestamps
    end
  end
end

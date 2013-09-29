class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end

    add_index :associations, :user_id
    add_index :associations, :game_id
    add_index :associations, [:user_id, :game_id], unique: true
  end
end

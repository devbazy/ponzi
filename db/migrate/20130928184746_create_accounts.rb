class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :amount
      t.string :daddr
      t.string :waddr
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :code
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end

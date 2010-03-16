class DropOwnership < ActiveRecord::Migration
  def self.up
    drop_table :ownerships
  end

  def self.down
    create_table :ownerships do |t|
      t.integer :user_id
      t.integer :building_id
      t.integer :count

      t.timestamps
    end
  end
end

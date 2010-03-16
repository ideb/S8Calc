class CreateOwnership < ActiveRecord::Migration
  def self.up
    create_table :ownerships do |t|
      t.integer :user_id
      t.integer :building_id
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :ownerships
  end
end

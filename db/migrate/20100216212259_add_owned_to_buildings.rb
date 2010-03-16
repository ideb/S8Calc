class AddOwnedToBuildings < ActiveRecord::Migration
  def self.up
      add_column :buildings, :owned, :integer
      add_column :buildings, :roi, :float
  end

  def self.down
      remove_column :buildings, :owned
      remove_column :buildings, :roi
  end
end

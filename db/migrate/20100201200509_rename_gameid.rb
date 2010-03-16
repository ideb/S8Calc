class RenameGameid < ActiveRecord::Migration
  def self.up
    rename_column :user_buildings, :game_id, :building_id
  end

  def self.down
    rename_column :user_buildings, :building_id, :game_id
  end
end

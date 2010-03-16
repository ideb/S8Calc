class DropUserBuildings < ActiveRecord::Migration
  def self.up
    drop_table :user_buildings
  end

  def self.down
    create_table :user_buildings do |t|
      t.integer :user_id
      t.integer :building_id
      t.integer :count
      
      t.timestamps
    end
  end
end

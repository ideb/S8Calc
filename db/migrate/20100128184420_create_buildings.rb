class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :name
      t.integer :cost
      t.integer :income
      t.integer :level
      t.references :game

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end

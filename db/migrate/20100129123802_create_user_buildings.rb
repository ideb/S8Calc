class CreateUserBuildings < ActiveRecord::Migration
  def self.up
    create_table :user_buildings do |t|
      t.references :game
      t.references :user
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :user_buildings
  end
end

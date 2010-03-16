class AddUrlnameToGames < ActiveRecord::Migration
  def self.up
      add_column :games, :urlname, :string
  end

  def self.down
      remove_column :games, :urlname
  end
end

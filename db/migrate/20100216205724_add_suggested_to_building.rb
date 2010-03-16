class AddSuggestedToBuilding < ActiveRecord::Migration
  def self.up
      add_column :buildings, :suggested, :integer
  end

  def self.down
      remove_column :buildings, :suggested, :integer
  end
end

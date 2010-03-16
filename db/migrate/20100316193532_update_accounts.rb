class UpdateAccounts < ActiveRecord::Migration
  def self.up
    change_column :accounts, :level, :integer, :default => "1"
  end

  def self.down
  end
end

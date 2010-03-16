class RenameUsername < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
    create_tabel :users do |t|
      t.timestamps
    end
  end
end

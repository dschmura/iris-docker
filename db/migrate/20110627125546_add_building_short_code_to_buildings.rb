class AddBuildingShortCodeToBuildings < ActiveRecord::Migration
  def self.up
    add_column :buildings, :building_short_code, :string
  end

  def self.down
    remove_column :buildings, :building_short_code
  end
end

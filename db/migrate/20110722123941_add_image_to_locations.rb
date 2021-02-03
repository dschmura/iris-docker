class AddImageToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :image, :string
  end

  def self.down
    remove_column :locations, :image
  end
end

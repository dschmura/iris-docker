class AddLatitudeLongitudeToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :name, :string
    add_column :buildings, :latitude, :float
    add_column :buildings, :longitude, :float
  end
end

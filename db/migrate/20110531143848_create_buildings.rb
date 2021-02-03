class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      #Each building has a unique numerical code.  
      #Not sure this will ever be used in favor of
      #the facility_code_heprod field in the rooms table.
      t.string :building_code_heprod
      t.integer :location_id
      t.string :address
      t.string :address2
      t.string :city, :default => "Ann Arbor"
      t.string :state, :default => "Mi"
      t.string :zip, :default => "48109"
      t.text :description
      t.text :history

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end

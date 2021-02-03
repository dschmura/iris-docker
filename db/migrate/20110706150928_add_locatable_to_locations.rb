class AddLocatableToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.references :locatable, :polymorphic => true
    end
    add_index :locations, [:locatable_id, :locatable_type]
  end

  def self.down
    remove_column :locations, :locatable_type
    remove_column :locations, :locatable_id
  end
end
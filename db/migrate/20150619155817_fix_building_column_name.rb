class FixBuildingColumnName < ActiveRecord::Migration
  def change
    rename_column :classrooms, :location_id, :building_id
  end
end

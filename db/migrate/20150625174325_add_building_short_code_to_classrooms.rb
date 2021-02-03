class AddBuildingShortCodeToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :building_short_code, :string
  end
end

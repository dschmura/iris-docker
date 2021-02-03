class AddLocationIdToClassroom < ActiveRecord::Migration
  def self.up
    add_column :classrooms, :location_id, :integer
  end

  def self.down
    remove_column :classrooms, :location_id
  end
end

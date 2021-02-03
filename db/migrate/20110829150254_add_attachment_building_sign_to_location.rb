class AddAttachmentBuildingSignToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :building_sign_file_name, :string
    add_column :locations, :building_sign_content_type, :string
    add_column :locations, :building_sign_file_size, :integer
    add_column :locations, :building_sign_updated_at, :datetime
  end

  def self.down
    remove_column :locations, :building_sign_file_name
    remove_column :locations, :building_sign_content_type
    remove_column :locations, :building_sign_file_size
    remove_column :locations, :building_sign_updated_at
  end
end

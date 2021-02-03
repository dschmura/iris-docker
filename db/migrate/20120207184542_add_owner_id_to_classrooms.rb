class AddOwnerIdToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :owner_id, :integer, :default => '1'
  end
end

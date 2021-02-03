class AddRmrecnbrToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :rmrecnbr, :integer
  end
end

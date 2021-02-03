class AddDeptGrpToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :DEPT_GRP, :string
  end
end

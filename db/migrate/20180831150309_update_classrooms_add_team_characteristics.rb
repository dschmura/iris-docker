class UpdateClassroomsAddTeamCharacteristics < ActiveRecord::Migration
  def change
    add_column :classrooms, :team_tables, :boolean
    add_column :classrooms, :team_technology, :boolean
    add_column :classrooms, :team_writing_surface, :boolean
  end
end

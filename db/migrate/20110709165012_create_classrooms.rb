class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|
      t.string :room_number
      t.string :facility_code_heprod
      t.integer :student_capacity
      t.boolean :light_control
      t.boolean :layout_platform
      t.boolean :layout_stage
      t.boolean :layout_tiered
      t.boolean :seating_auditorium
      t.boolean :seating_chairs_fixed
      t.boolean :seating_movable_tables_chairs
      t.boolean :seating_table_conference
      t.boolean :seating_tables_any
      t.boolean :seating_tables_fixed
      t.boolean :seating_tables_moveable
      t.boolean :sound_amplification
      t.boolean :ethernet_students
      t.boolean :power_students
      t.boolean :writing_surface_chalkboard_any
      t.boolean :writing_surface_chalkboard_25ft
      t.boolean :writing_surface_whiteboard_any
      t.boolean :writing_surface_whiteboard_25ft
      t.boolean :computer_classroom_any
      t.boolean :computer_classroom_mac
      t.boolean :computer_classroom_windows
      t.boolean :assisted_listening
      t.boolean :wheelchair_instructor
      t.boolean :dvd_player_regular
      t.boolean :dvd_player_blueray
      t.boolean :captioning_device
      t.boolean :podium_computer_any
      t.boolean :podium_computer_mac
      t.boolean :podium_computer_windows
      t.boolean :document_camera
      t.boolean :interactive_pen
      t.boolean :lecture_capture
      t.boolean :telephone
      t.boolean :video_conferencing
      t.boolean :projection_16mm_film
      t.boolean :projection_35mm_file
      t.boolean :projection_digital_data_video
      t.boolean :projection_traditional_slide
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end

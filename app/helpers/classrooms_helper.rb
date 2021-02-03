# == Schema Information
#
# Table name: classrooms
#
#  id                              :integer          not null, primary key
#  room_number                     :string(255)
#  facility_code_heprod            :string(255)
#  student_capacity                :integer
#  light_control                   :boolean
#  layout_platform                 :boolean
#  layout_stage                    :boolean
#  layout_tiered                   :boolean
#  seating_auditorium              :boolean
#  seating_chairs_fixed            :boolean
#  seating_movable_tables_chairs   :boolean
#  seating_table_conference        :boolean
#  seating_tables_any              :boolean
#  seating_tables_fixed            :boolean
#  seating_tables_moveable         :boolean
#  sound_amplification             :boolean
#  ethernet_students               :boolean
#  power_students                  :boolean
#  writing_surface_chalkboard_any  :boolean
#  writing_surface_chalkboard_25ft :boolean
#  writing_surface_whiteboard_any  :boolean
#  writing_surface_whiteboard_25ft :boolean
#  computer_classroom_any          :boolean
#  computer_classroom_mac          :boolean
#  computer_classroom_windows      :boolean
#  assisted_listening              :boolean
#  wheelchair_instructor           :boolean
#  dvd_player_regular              :boolean
#  dvd_player_blueray              :boolean
#  captioning_device               :boolean
#  podium_computer_any             :boolean
#  podium_computer_mac             :boolean
#  podium_computer_windows         :boolean
#  document_camera                 :boolean
#  interactive_pen                 :boolean
#  lecture_capture                 :boolean
#  telephone                       :boolean
#  video_conferencing              :boolean
#  projection_16mm_film            :boolean
#  projection_35mm_file            :boolean
#  projection_digital_data_video   :boolean
#  projection_traditional_slide    :boolean
#  notes                           :text
#  created_at                      :datetime
#  updated_at                      :datetime
#  building_id                     :integer
#  is_department_space             :boolean          default(FALSE)
#  owner_id                        :integer          default(1)
#  rmrecnbr                        :integer
#  DEPT_GRP                        :string(255)
#  sound_amplification_voice       :boolean
#  building_short_code             :string
#

module ClassroomsHelper
  # def ccl_nub_converter(classroom)
  #   if classroom.facility_code_heprod.include?('NUB')
  #     classroom.facility_code_heprod.gsub('NUB', 'CCL')
  #   else
  #     classroom.facility_code_heprod
  #   end
  # end

  # Displays Alert message for classrooms that require a technician
  # to operate. Rooms that require technicians are stored in the technician_required_rooms array
  # and indicated with the room facility_code_heprod variable.
  def technician_required
    technician_required_rooms = ['AHA', 'AHB', 'AHC', 'AHD', 'CHEM1800', 'EH1324', 'NS2140', 'LORCH140', 'MLB1200', 'MLB1400', 'MLB1420']
    technician_required_message = 'Alert: An LSA Technician is required for all presentation needs. Please call (734) 615-0100, and request our Special Events team.'

    team_learning_rooms = ['BSB1060', 'LSA1280', 'WEIS110', 'CHEMA859']

    team_learning_room_message = 'Alert: This is a team based learning classroom.  Training on the equipment is highly recommended. Please call (734) 615-0100 prompt 1 and ask to schedule a training in this room.'

    tech_req = image_tag("Open_For_Business_Sign.png", :alt => "We are open for change.  Please contribute your feedback.", :class => 'construction')

    if technician_required_rooms.include? @classroom.facility_code_heprod
      technician_required_message
      elsif team_learning_rooms.include? @classroom.facility_code_heprod
      team_learning_room_message
    end
  end

  def classroom_image
    @classroom.location.picture.url(:show).to_s

  end

  def attribute_true?(condition)
   if condition
    'attribute_true'
   else
    'attribute_false'
   end
  end

  def departmental_room?
    if  @classroom.DEPT_GRP == 'COLLEGE_OF_LSA'
      if @classroom.owner_id == 1
        "LSA ISS Room"
      else
        "Departmental Room"
      end
    elsif @classroom.DEPT_GRP == 'SCHOOL_DENTISTRY'
      'Dental School'
    elsif @classroom.DEPT_GRP == 'LAW_SCHOOL'
      'Law School'
    elsif @classroom.DEPT_GRP == 'COLLEGE_PHARMACY'
      'College of Pharmancy'
    elsif @classroom.DEPT_GRP == 'SCHOOL_PUB_POLICY'
      'Ford School of Public Policy'
    elsif @classroom.DEPT_GRP == 'VP_ACAD_GRAD_STUDY'
      'Museum of Art'
    elsif @classroom.DEPT_GRP == 'SCHOOL_DENTISTRY'
      'School of Dentistry'
    elsif @classroom.DEPT_GRP == 'SCHOOL_EDUCATION'
      'School of Education'
    elsif @classroom.DEPT_GRP == 'SCHOOL_INFORMATION'
      'School of Information'
    elsif @classroom.DEPT_GRP == 'SCHOOL_NAT_RES_ENVIR'
      'School for Environment and Sustainability'
    elsif @classroom.DEPT_GRP == 'SCHOOL_SOCIAL_WORK'
      'School of Scoial Work'
    else
      'Departmental Room'
    end

  end


  def basement
    # Buildings with basements or other weird floors
    # AH (G)
    # CHEM (A)
    # EH (B)
    # EQ (B)
    # HH (G)
    # MH (G)
    # MLB (B)

    $basement = @classroom.facility_code_heprod
    prefix = "../maps/"
    suffix = ".html"
    case $basement
      # Angell Hall floors G or Auds point to ahg
    	when (/AHG|AHA|AHB|AHC|AHD/)
    	  "ahg"
    	when /CHEMA/
    	  "chema"
    	when /DENTG/
    	  "dentg"
    	when /DENTB/
    	  "dentb"
    	when /EHB/
    	  "ehb"
    	when /EQB/
    	  "eqb"
    	when /HHG/
    	  "hhg"
    	when /MHG/
    	  "mhg"
    	when /MLBB/
        "mlbb"
    	else
    	  "" + @classroom.facility_code_heprod.scan(/(\D+)+(\d)/).join.downcase
    	end



  end

  def floor_map
    floor_map = basement.split(".")[0] + ".jpg"
  end

end

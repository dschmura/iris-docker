class ClassroomPdf < Prawn::Document
  include ClassroomsHelper
  include RoomScheduleContactsHelper
  def initialize(classroom)
    super(top_margin: 70, page_layout: :landscape)

    @classroom = classroom
    @room_schedule_contact = RoomScheduleContact.find_by rmrecnbr:(@classroom.rmrecnbr)

    classroom_image
    classroom_instructions.encode("windows-1252", "UTF-8")
    classroom_seating_chart
    logos
    classroom_name
    classroom_capacity
    classroom_qr_code
    classroom_url
    classroom_support_contact


  end

  def classroom_support_contact
    y_position = cursor + 250
    bounding_box([10, 200], width: 350) do
      text "Support for this room is provided by "
      text "<b><color rgb='3A5AA0'>#{@room_schedule_contact.RM_SPPT_DEPT_DESCR}</color></b>", inline_format: :true

      text "<b>Support Contact:</b> <color rgb='DD0806'> #{@room_schedule_contact.RM_SPPT_CNTCT_EMAIL}</color>", inline_format: :true
      text "<b>Support Contact Phone:</b> <color rgb='DD0806'> #{@room_schedule_contact.RM_SPPT_CNTCT_PHONE}</color>", inline_format: :true
    end
  end
  def logos
    image "#{Rails.root}/app/assets/images/logoBlockM_univers.png", fit: [250, 200], at: [75, 70]
  end

  def classroom_url
    bounding_box([75,20 ], :width => 300) do
      transparent(0) {stroke_bounds}
      text "http://rooms.lsa.umich.edu/classrooms/#{@classroom.facility_code_heprod}", size: 12, color: "3A5AA0"
    end
  end

  def classroom_name
    bounding_box([10,500 ], :width => 350) do
      transparent(0) {stroke_bounds}
      text "#{@classroom.location.name}", size: 20, style: :bold, color: "3A5AA0"
    end
  end

  def classroom_image
    y_position = cursor - 430
    if File.exist?("#{@classroom.location.picture.path(:show)}")

      transparent(0.5) {stroke_bounds}
      image "#{@classroom.location.picture.path(:show)}",  fit: [350, 100], position: 10, vposition: y_position

    end
  end

  def classroom_seating_chart

    if File.exist?("#{Rails.root}/app/assets/images/seating/#{@classroom.facility_code_heprod}_chairs.png")
    image "#{Rails.root}/app/assets/images/seating/#{@classroom.facility_code_heprod}_chairs.png", :fit => [330, 425], at:[375, 475]

    end
  end

  def classroom_floor_map
    if File.exist?("#{Rails.root}/public/maps/#{floor_map}")
      image "#{Rails.root}/public/maps/#{floor_map}", :fit => [300 , 300], at:[025, 375]
    end
  end

  def classroom_capacity
    y_position = cursor - 0
    bounding_box([10, y_position], :width => 225) do
      text "Student Capacity: #{@classroom.student_capacity}", size: 14, style: :bold
    end
  end

  def classroom_qr_code
    y_position = cursor + 10
    bounding_box([0, 75], :width => 125) do
      qrcode = "http://rooms.lsa.umich.edu/classrooms/#{@classroom.facility_code_heprod}"
      print_qr_code(qrcode, :extent=>85, stroke: false)
    end
  end

  def classroom_instructions


    text_box "Please return the furniture to this arrangment when finished.", at: [400, 37], width: 300, align: :center, size: 14, style: :bold
  end

  def facility_code_heprod
    text "#{@classroom.facility_code_heprod}"
  end
end
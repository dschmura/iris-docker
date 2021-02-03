pdf.font_size 18
pdf.text "#{@classroom.location.name}"

pdf.font_size 13
pdf.text "Student Capacity: #{@classroom.student_capacity}"
pdf.move_down 20
pdf.font_size 12
pdf.text "Please return the furniture to this arrangement when finished."

pdf.text "#{@classroom.facility_code_heprod}"

#classroom_image = "#{RAILS_ROOT}assets/seating/#{@classroom.facility_code_heprod}.jpg"
#pdf.image classroom_image


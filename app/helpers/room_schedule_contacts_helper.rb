# == Schema Information
#
# Table name: room_schedule_contacts
#
#  id                   :integer          not null, primary key
#  rmrecnbr             :integer
#  rm_schd_cntct_name   :string(255)
#  rm_schd_email        :string(255)
#  rm_schd_cntct_phone  :string(255)
#  rm_det_url           :string(255)
#  rm_usage_guidlns_url :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  RM_SPPT_DEPTID       :string(255)
#  RM_SPPT_DEPT_DESCR   :string(255)
#  RM_SPPT_CNTCT_EMAIL  :string(255)
#  RM_SPPT_CNTCT_PHONE  :string(255)
#  RM_SPPT_CNTCT_URL    :string(255)
#

module RoomScheduleContactsHelper

  def scheduling_contact_email
    if @room_schedule_contact.rm_schd_email.present?
      mail_to @room_schedule_contact. rm_schd_email.to_s, truncate(@room_schedule_contact.rm_schd_cntct_name, :length => 40)
    else
      "Scheduling Contact Not Available"

    end
  end

  def support_contact_email
    if @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.present?
      mail_to @room_schedule_contact.RM_SPPT_CNTCT_EMAIL.to_s, truncate(@room_schedule_contact.RM_SPPT_DEPT_DESCR, :length => 40)
    else
      "Support Contact Not Available"
    end
  end

  def support_contact_phone
    if @room_schedule_contact.RM_SPPT_CNTCT_PHONE.present?
      mail_to @room_schedule_contact.RM_SPPT_CNTCT_PHONE.to_s, truncate(@room_schedule_contact.RM_SPPT_CNTCT_PHONE, :length => 40)
    else
      "Support Contact Not Available"
    end
  end

  def floor_plan
    if  File.exist?("#{Rails.root}/public/maps/#{basement}.html")
      link_to @classroom.location.name, "../maps/#{basement}.html"
    else
      "Floor Map Not Available"
    end
  end
end

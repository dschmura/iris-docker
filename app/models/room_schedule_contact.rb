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

class RoomScheduleContact < ActiveRecord::Base
  # attr_accessible :title, :body
  
  
  belongs_to :classroom
  accepts_nested_attributes_for :classroom, :allow_destroy => true
  
  # Setup accessible (or protected) attributes for your model

  attr_accessible :rmrecnbr, :rm_schd_cntct_name, :rm_schd_email, :rm_schd_cntct_phone, :rm_det_url, :rm_usage_guidlns_url,
                  :RM_SPPT_DEPTID, :RM_SPPT_DEPT_DESCR, :RM_SPPT_CNTCT_EMAIL, :RM_SPPT_CNTCT_PHONE, :RM_SPPT_CNTCT_URL

  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      roomschedulecontact = find_by_rmrecnbr(row["RMRECNBR"]) || new
      roomschedulecontact.update_attributes(rm_schd_cntct_name: row["RM_SCHD_CNTCT_NAME"], rm_schd_email: row["RM_SCHD_EMAIL"], rm_schd_cntct_phone: row["RM_SCHD_CNTCT_PHONE"], rm_det_url: row["RM_DET_URL"], rm_usage_guidlns_url:  row["RM_USAGE_GUIDLNS_URL"], RM_SPPT_DEPTID: row["RM_SPPT_DEPTID"], RM_SPPT_DEPT_DESCR: row["RM_SPPT_DEPT_DESCR"], RM_SPPT_CNTCT_EMAIL: row["RM_SPPT_CNTCT_EMAIL"] , RM_SPPT_CNTCT_PHONE: row["RM_SPPT_CNTCT_PHONE"] , RM_SPPT_CNTCT_URL: row["RM_SPPT_CNTCT_URL"])
    
    end
    

  end
end

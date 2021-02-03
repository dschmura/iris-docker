require 'csv'

namespace :import do

  desc "Import contact information for rooms"
  task room_schedule_contacts: :environment do
    filename = File.join Rails.root, 'contacts_test.csv'
    CSV.foreach(filename, headers: true) do |row|
      room = RoomScheduleContact.find_by_rmrecnbr(row["RMRECNBR"]) || new 

      room.update_attributes(rm_schd_cntct_name: row["RM_SCHD_CNTCT_NAME"], rm_schd_email: row["RM_SCHD_EMAIL"], rm_schd_cntct_phone: row["RM_SCHD_CNTCT_PHONE"], rm_det_url: row["RM_DET_URL"], rm_usage_guidlns_url:  row["RM_USAGE_GUIDLNS_URL"], RM_SPPT_DEPTID: row["RM_SPPT_DEPTID"], RM_SPPT_DEPT_DESCR: row["RM_SPPT_DEPT_DESCR"], RM_SPPT_CNTCT_EMAIL: row["RM_SPPT_CNTCT_EMAIL"] , RM_SPPT_CNTCT_PHONE: row["RM_SPPT_CNTCT_PHONE"] , RM_SPPT_CNTCT_URL: row["RM_SPPT_CNTCT_URL"])
      room.save!
    end
  end

  desc "Import rooms characteristics"
  task room_schedule_contacts: :environment do
    filename = File.join Rails.root, 'rooms.csv'
    CSV.foreach(filename, headers: true) do |row|
      room = Classroom.find_by_rmrecnbr(row["RMRECNBR"]) || new 

      room.update_attributes(rm_schd_cntct_name: row["RM_SCHD_CNTCT_NAME"], rm_schd_email: row["RM_SCHD_EMAIL"], rm_schd_cntct_phone: row["RM_SCHD_CNTCT_PHONE"], rm_det_url: row["RM_DET_URL"], rm_usage_guidlns_url:  row["RM_USAGE_GUIDLNS_URL"], RM_SPPT_DEPTID: row["RM_SPPT_DEPTID"], RM_SPPT_DEPT_DESCR: row["RM_SPPT_DEPT_DESCR"], RM_SPPT_CNTCT_EMAIL: row["RM_SPPT_CNTCT_EMAIL"] , RM_SPPT_CNTCT_PHONE: row["RM_SPPT_CNTCT_PHONE"] , RM_SPPT_CNTCT_URL: row["RM_SPPT_CNTCT_URL"])
      room.save!
    end
  end
end
class FixRoomScheduleContactsColumnNames < ActiveRecord::Migration
  def change
    change_table :room_schedule_contacts do |t|
          t.rename :RMRECNBR, :rmrecnbr
          t.rename :RM_SCHD_CNTCT_NAME, :rm_schd_cntct_name
          t.rename :RM_SCHD_EMAIL, :rm_schd_email
          t.rename :RM_SCHD_CNTCT_PHONE, :rm_schd_cntct_phone
          t.rename :RM_DET_URL, :rm_det_url
          t.rename :RM_USAGE_GUIDLNS_URL, :rm_usage_guidlns_url
    end
  end
end

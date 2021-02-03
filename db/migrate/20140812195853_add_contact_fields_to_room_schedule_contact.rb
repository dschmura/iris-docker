class AddContactFieldsToRoomScheduleContact < ActiveRecord::Migration
  def change
    add_column :room_schedule_contacts, :RM_SPPT_DEPTID, :string
    add_column :room_schedule_contacts, :RM_SPPT_DEPT_DESCR, :string
    add_column :room_schedule_contacts, :RM_SPPT_CNTCT_EMAIL, :string
    add_column :room_schedule_contacts, :RM_SPPT_CNTCT_PHONE, :string
    add_column :room_schedule_contacts, :RM_SPPT_CNTCT_URL, :string
  end
end

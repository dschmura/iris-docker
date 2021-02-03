class CreateRoomScheduleContacts < ActiveRecord::Migration
  def change
    create_table :room_schedule_contacts do |t|
      t.column :RMRECNBR, :integer
      t.column :RM_SCHD_CNTCT_NAME, :string
      t.column :RM_SCHD_EMAIL, :string
      t.column :RM_SCHD_CNTCT_PHONE, :string
      t.column :RM_DET_URL, :string
      t.column :RM_USAGE_GUIDLNS_URL, :string
      t.timestamps
    end
  end
end

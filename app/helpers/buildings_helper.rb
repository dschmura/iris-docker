# == Schema Information
#
# Table name: buildings
#
#  id                   :integer          not null, primary key
#  building_code_heprod :string(255)
#  location_id          :integer
#  address              :string(255)
#  address2             :string(255)
#  city                 :string(255)      default("Ann Arbor")
#  state                :string(255)      default("Mi")
#  zip                  :string(255)      default("48109")
#  description          :text
#  history              :text
#  created_at           :datetime
#  updated_at           :datetime
#  building_short_code  :string(255)
#  name                 :string
#  latitude             :float
#  longitude            :float
#

module BuildingsHelper
end

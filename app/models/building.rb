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

class Building < ActiveRecord::Base
  has_one :location, as: :locatable


  accepts_nested_attributes_for :location, :allow_destroy => true

  validates :building_short_code, :presence => true
  validates_presence_of :address, :city, :state, :zip

  validates_uniqueness_of :address
  #Makes for links on the site more SEO friendly
  def to_param
    "#{id}-#{location.name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
end

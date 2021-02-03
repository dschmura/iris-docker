# == Schema Information
#
# Table name: locations
#
#  id                         :integer          not null, primary key
#  latitude                   :float(255)
#  longitude                  :float(255)
#  name                       :string(255)
#  description                :text
#  created_at                 :datetime
#  updated_at                 :datetime
#  gmaps                      :boolean
#  type                       :string(255)
#  locatable_id               :integer
#  locatable_type             :string(255)
#  image                      :string(255)
#  picture_file_name          :string(255)
#  picture_content_type       :string(255)
#  picture_file_size          :integer
#  picture_updated_at         :datetime
#  building_sign_file_name    :string(255)
#  building_sign_content_type :string(255)
#  building_sign_file_size    :integer
#  building_sign_updated_at   :datetime
#  visible                    :boolean          default(TRUE)
#

module LocationsHelper
end

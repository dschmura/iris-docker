# == Schema Information
#
# Table name: assets
#
#  id                          :integer          not null, primary key
#  location_id                 :integer
#  created_at                  :datetime
#  updated_at                  :datetime
#  panorama_asset_file_name    :string(255)
#  panorama_asset_content_type :string(255)
#  panorama_asset_file_size    :integer
#  panorama_asset_updated_at   :datetime
#

require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

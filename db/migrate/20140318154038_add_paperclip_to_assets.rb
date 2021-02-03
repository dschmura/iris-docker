class AddPaperclipToAssets < ActiveRecord::Migration

  
  def self.up
    add_attachment :assets, :panorama_asset
  end

  def self.down
    remove_attachment :assets, :panorama_asset
  end
end

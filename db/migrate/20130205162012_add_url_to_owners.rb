class AddUrlToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :url, :string
  end
end

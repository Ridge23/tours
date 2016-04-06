class AddAddressToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :address, :string
  end
end

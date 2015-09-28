class AddAssetTypeIdToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :asset_type_id, :integer
  end
end

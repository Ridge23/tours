class AddLatitudeLongitudeToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :latitude, :float
    add_column :assets, :longitude, :float
  end
end

class AddMediaFileDuration < ActiveRecord::Migration
  def change
    add_column :asset_media, :media_duration, :string
  end
end

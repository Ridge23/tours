class AddMediaFilePosition < ActiveRecord::Migration
  def change
    add_column :asset_media, :position, :integer
  end
end

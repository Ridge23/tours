class AddFilesUrlsAssets < ActiveRecord::Migration
  def change
    add_column :assets, :text_file_url, :string
    add_column :assets, :audio_file_url, :string
  end
end

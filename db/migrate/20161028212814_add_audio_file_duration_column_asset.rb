class AddAudioFileDurationColumnAsset < ActiveRecord::Migration
  def change
    add_column :assets, :audio_duration, :string
  end
end

class AddAttachmentAudioFileToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :audio_file
    end
  end

  def self.down
    remove_attachment :assets, :audio_file
  end
end

class AddAttachmentThumbnailToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :assets, :thumbnail
  end
end

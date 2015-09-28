class AddAttachmentTextFileToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :text_file
    end
  end

  def self.down
    remove_attachment :assets, :text_file
  end
end

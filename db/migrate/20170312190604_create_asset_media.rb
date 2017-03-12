class CreateAssetMedia < ActiveRecord::Migration
  def self.up
    create_table :asset_media do |t|
      t.string :title
      t.string :description
      t.integer :asset_id
      t.attachment :media_file
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :asset_media
  end
end

class CreateAssetTypes < ActiveRecord::Migration
  def change
    create_table :asset_types do |t|
      t.string :title
      t.boolean :published

      t.timestamps
    end
  end
end

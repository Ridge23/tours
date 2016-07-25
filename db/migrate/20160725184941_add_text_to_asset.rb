class AddTextToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :text, :string
  end
end

class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :image_url, :string
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :facebook_link, :string
  end
end

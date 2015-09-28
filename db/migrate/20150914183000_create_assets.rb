class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :type_id
      t.integer :country_id
      t.integer :city_id
      t.integer :paid_condition_id

      t.timestamps
    end
  end
end

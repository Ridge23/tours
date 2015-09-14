class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :code
      t.string :iso_name
      t.boolean :enabled
    end
  end
end

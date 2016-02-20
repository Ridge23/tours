class AddPriceToCity < ActiveRecord::Migration
  def change
    add_column :cities, :price, :float
  end
end

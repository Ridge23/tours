class CreatePaidConditions < ActiveRecord::Migration
  def change
    create_table :paid_conditions do |t|
      t.string :title
      t.boolean :enabled

      t.timestamps
    end
  end
end

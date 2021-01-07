class CreateFootprints < ActiveRecord::Migration[5.2]
  def change
    create_table :footprints do |t|
      t.float :carbon_in_kg
      t.float :offset_cost_total
      t.string :offset_cost_currency

      t.timestamps
    end
  end
end

class CreateFootprints < ActiveRecord::Migration[5.2]
  def change
    create_table :footprints do |t|
      t.references :car_monthly_mileage, foreign_key: true
      t.float :carbon_in_kg
      t.float :offset_cost_total
      t.string :offset_cost_currency

      t.timestamps
    end
  end
end

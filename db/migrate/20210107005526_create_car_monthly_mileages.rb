class CreateCarMonthlyMileages < ActiveRecord::Migration[5.2]
  def change
    create_table :car_monthly_mileages do |t|
      t.references :car, foreign_key: true
      t.integer :total_mileage
      t.string :month
      t.string :year

      t.timestamps
    end
  end
end

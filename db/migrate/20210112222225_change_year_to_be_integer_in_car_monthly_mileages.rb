class ChangeYearToBeIntegerInCarMonthlyMileages < ActiveRecord::Migration[5.2]
  def change
    change_column :car_monthly_mileages, :year, 'integer USING CAST(year AS integer)'
  end
end

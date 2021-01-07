class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mpg
      t.string :fuel_type

      t.timestamps
    end
  end
end

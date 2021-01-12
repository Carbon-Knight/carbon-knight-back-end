require 'rails_helper'

describe "As a User " do
  before :each do
    @car = Car.create(id: 5, user_id: 1, make: "Chevy", model: 'Cobalt', year: 2006, mpg: 25, fuel_type: 'gasoline')

    @foot = Footprint.create(id: 5, carbon_in_kg: 1.1, offset_cost_total: 2.37, offset_cost_currency: 'USD')

    @cmm = CarMonthlyMileage.create(car_id: 5, footprint_id: 5, total_mileage: 35000, month: "March", year: "2011")


  end
  it "can update their carbon footprint", :vcr do
    query_string = <<-GRAPHQL
    mutation {
      updateCarMonthlyMileage(input:{
        carId: #{@car.id},
        totalMileage: 22,
        month: "#{@cmm.month}",
        year: "2011"
    }) {
      footprint {
        carbonInKg
        offsetCostTotal
        offsetCostCurrency
      }
    }
  }
    GRAPHQL

    post graphql_path, params: {query: query_string}
    result = JSON.parse(response.body,)

    expect(@foot.total_cost).to_not eq(2.37)
  end
end

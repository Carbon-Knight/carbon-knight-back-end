require 'rails_helper'

describe 'As a User ' do
  before :each do
    @car = Car.create(id: 5, user_id: 1, make: 'Chevy', model: 'Cobalt', year: 2006, mpg: 25, fuel_type: 'gasoline')

    @foot = Footprint.create(id: 5, carbon_in_kg: 12_444.511, offset_cost_total: 28.14, offset_cost_currency: 'USD')

    @cmm = CarMonthlyMileage.create(car_id: 5, footprint_id: 5, total_mileage: 35_000, month: 'March', year: '2011')
  end

  it 'can update their carbon footprint', :vcr do
    query_string = <<-GRAPHQL
    mutation {
      updateCarMonthlyMileage(input:{
        id: #{@cmm.id},
        totalMileage: 22
    }) {
      footprint {
        carbonInKg
        offsetCostTotal
        offsetCostCurrency
      }
    }
  }
    GRAPHQL

    post graphql_path, params: { query: query_string }

    @cmm.reload
    expect(@cmm.total_mileage).to_not eq(35_000)
    expect(@cmm.total_mileage).to eq(22)

    @foot.reload
    expect(@foot.carbon_in_kg).to_not eq(12_444.511)
    expect(@foot.carbon_in_kg).to eq(7.822)
    expect(@foot.offset_cost_total).to_not eq(28.14)
    expect(@foot.offset_cost_total).to eq(0.27)
  end
end

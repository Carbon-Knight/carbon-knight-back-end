require 'rails_helper'

describe 'CarMonthlyMileageQuery' do
  before :each do
    @car = Car.create(
      id: 5,
      user_id: 1,
      make: "Chevy",
      model: 'Cobalt',
      year: 2006,
      mpg: 25,
      fuel_type: 'gasoline'
    )

    @footprint = Footprint.create(
      id: 5,
      carbon_in_kg: 12444.511,
      offset_cost_total: 28.14,
      offset_cost_currency: 'USD'
    )

    @cmm1 = CarMonthlyMileage.create(
      car_id: 5,
      footprint_id: 5,
      total_mileage: 35000,
      month: "March",
      year: 2011
    )
  end

  it 'can get a single CarMonthlyMileage with id as input' do
    query_string = <<-GRAPHQL
      query {
        carMonthlyMileage(id: #{@cmm1.id}) {
          id
          month
          year
          totalMileage
          car {
            id
            make
            model
            year
            mpg
            fuelType
          }
        }
      }
    GRAPHQL


    post graphql_path, params: { query: query_string }
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:data][:carMonthlyMileage][:id]).to eq("#{@cmm1.id}")
    expect(result[:data][:carMonthlyMileage][:month]).to eq(@cmm1.month)
    expect(result[:data][:carMonthlyMileage][:year]).to eq(@cmm1.year)
    expect(result[:data][:carMonthlyMileage][:totalMileage]).to eq(@cmm1.total_mileage)
    expect(result[:data][:carMonthlyMileage][:car]).to have_key(:id)
    expect(result[:data][:carMonthlyMileage][:car][:id]).to eq("#{@car.id}")
    expect(result[:data][:carMonthlyMileage][:car]).to have_key(:make)
    expect(result[:data][:carMonthlyMileage][:car][:make]).to eq(@car.make)
    expect(result[:data][:carMonthlyMileage][:car]).to have_key(:model)
    expect(result[:data][:carMonthlyMileage][:car][:model]).to eq(@car.model)
    expect(result[:data][:carMonthlyMileage][:car]).to have_key(:year)
    expect(result[:data][:carMonthlyMileage][:car][:year]).to eq(@car.year)
    expect(result[:data][:carMonthlyMileage][:car]).to have_key(:mpg)
    expect(result[:data][:carMonthlyMileage][:car][:mpg]).to eq(@car.mpg)
    expect(result[:data][:carMonthlyMileage][:car]).to have_key(:fuelType)
    expect(result[:data][:carMonthlyMileage][:car][:fuelType]).to eq(@car.fuel_type)
  end
end

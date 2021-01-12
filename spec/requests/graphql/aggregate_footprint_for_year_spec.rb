require 'rails_helper'

describe 'Fetch aggregate footprint query for year' do
  it 'Returns the agregate carbon_in_kg when given a user_id, and year' do
    car_1 = Car.create(
      user_id: 1,
      make: 'Fiat',
      model: '500',
      year: 2015,
      mpg: 14,
      fuel_type: 'gasoline'
    )

    car_2 = Car.create(
      user_id: 1,
      make: 'Audi',
      model: 'A8',
      year: 2016,
      mpg: 28,
      fuel_type: 'gasoline'
    )

    footprint_1 = Footprint.create(
      carbon_in_kg: 20.1,
      offset_cost_total: 0.82,
      offset_cost_currency: 'USD'
    )

    footprint_2 = Footprint.create(
      carbon_in_kg: 28.6,
      offset_cost_total: 1.82,
      offset_cost_currency: 'USD'
    )

    footprint_3 = Footprint.create(
      carbon_in_kg: 28.6,
      offset_cost_total: 1.82,
      offset_cost_currency: 'USD'
    )

    CarMonthlyMileage.create(
      car_id: car_1.id,
      footprint_id: footprint_1.id,
      total_mileage: 1090,
      month: 'march',
      year: '2020'
    )

    CarMonthlyMileage.create(
      car_id: car_2.id,
      footprint_id: footprint_2.id,
      total_mileage: 1090,
      month: 'june',
      year: '2020'
    )

    CarMonthlyMileage.create(
      car_id: car_2.id,
      footprint_id: footprint_3.id,
      total_mileage: 1090,
      month: 'january',
      year: '2020'
    )

    query_string = <<-GRAPHQL
      query {
        fetchUserAggregateFootprintForYear(userId: 1, year: "2020"){
          carbonInKg
        }
      }

    GRAPHQL

    post graphql_path, params: { query: query_string}
    result = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry

    # expect(result[:data].class).to eq(Hash)
    # expect(result[:data][:fetchUserAggregateFootprintForYear])
    # expect(result[:data][:fetchUserAggregateFootprintForYear][:carbonInKg]).to eq(48.7)
  end
end

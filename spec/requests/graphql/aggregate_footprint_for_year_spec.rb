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
      month: 'March',
      year: 2020
    )

    CarMonthlyMileage.create(
      car_id: car_2.id,
      footprint_id: footprint_2.id,
      total_mileage: 1090,
      month: 'June',
      year: 2020
    )

    CarMonthlyMileage.create(
      car_id: car_2.id,
      footprint_id: footprint_3.id,
      total_mileage: 1090,
      month: 'January',
      year: 2020
    )

    query_string = <<-GRAPHQL

    query {
      fetchUserAggregateFootprintForYear(userId: 1, year: 2020){
        footprints{
          month
          carbonInKg
          }
        }
      }

    GRAPHQL


    post graphql_path, params: { query: query_string}
    result = JSON.parse(response.body, symbolize_names: true)
    
    expect(result[:data].class).to eq(Hash)
    expect(result[:data][:fetchUserAggregateFootprintForYear].class).to eq(Hash)
    expect(result[:data][:fetchUserAggregateFootprintForYear][:footprints].class).to eq(Array)
    expect(result[:data][:fetchUserAggregateFootprintForYear][:footprints].first.class).to eq(Hash)
    expect(result[:data][:fetchUserAggregateFootprintForYear][:footprints].first.has_key?(:month)).to eq(true)
    expect(result[:data][:fetchUserAggregateFootprintForYear][:footprints].first.has_key?(:carbonInKg)).to eq(true)
  end
end

require 'rails_helper'

describe 'Fetch All User Car Monthly Mileages Query' do
  it 'returns all car mileage info based on user id' do
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
        fetchAllUserCarMonthlyMileages(userId: 1){
          id
          month
          year
          totalMileage
          }
        }

    GRAPHQL

    post graphql_path, params: { query: query_string}
    result = JSON.parse(response.body, symbolize_names: true)

    data = result[:data][:fetchAllUserCarMonthlyMileages].first

    expect(result[:data]).to be_a(Hash)

    expect(result[:data][:fetchAllUserCarMonthlyMileages]).to be_an(Array)
    expect(data).to be_a(Hash)

    expect(data.has_key?(:id)).to eq(true)
    expect(data[:id].class).to eq(String)

    expect(data.has_key?(:month)).to eq(true)
    expect(data[:month].class).to eq(String)

    expect(data.has_key?(:year)).to eq(true)
    expect(data[:year].class).to eq(Integer)

    expect(data.has_key?(:totalMileage)).to eq(true)
    expect(data[:totalMileage].class).to eq(Integer)
  end
end

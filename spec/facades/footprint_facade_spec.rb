require 'rails_helper'

describe 'Footprint Facade' do
  it 'creates a footprint' do
    VCR.use_cassette('vehicle_footprint_request') do
      car = Car.create!(
        user_id: 1,
        make: 'Nissan',
        model: 'Frontier',
        year: '2003',
        mpg: 22,
        fuel_type: 'gasoline'
      )
      mileage = 9001

      footprint = FootprintFacade.create_footprint(car, mileage)

      expect(footprint).to be_a(Footprint)
      expect(footprint.carbon_in_kg).to be_a(Float)
      expect(footprint.offset_cost_total).to be_a(Float)
      expect(footprint.offset_cost_currency).to be_a(String)
    end
  end

  it "Returns a hash of the aggregate carbon_in_kg" do
    user_id = 1

    car_1 = Car.create(
      user_id: user_id,
      make: 'Fiat',
      model: '500',
      year: 2015,
      mpg: 14,
      fuel_type: 'gasoline'
    )

    car_2 = Car.create(
      user_id: user_id,
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

    CarMonthlyMileage.create(
      car_id: car_1.id,
      footprint_id: footprint_1.id,
      total_mileage: 1090,
      month: 'July',
      year: '2020'
    )

    CarMonthlyMileage.create(
      car_id: car_2.id,
      footprint_id: footprint_2.id,
      total_mileage: 1090,
      month: 'July',
      year: '2020'
    )

    result = FootprintFacade.aggregate_footprint_for_month(user_id, "july", "2020")
    expect(result.class).to eq(Hash)
    expect(result.has_key?(:carbon_in_kg)).to eq(true)
    expect(result[:carbon_in_kg]).to eq(48.7)
  end
end

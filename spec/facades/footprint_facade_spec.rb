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
end

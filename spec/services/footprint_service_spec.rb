require 'rails_helper'

describe 'Footprint Service' do
  it 'can get cloverly response' do
    VCR.use_cassette('vehicle_footprint_request', record: :new_episodes) do
      car = Car.create!(
        user_id: 1,
        make: 'Nissan',
        model: 'Frontier',
        year: '2003',
        mpg: 22,
        fuel_type: 'gasoline'
      )
      data = FootprintService.vehicle_footprint(car, 9001)

      expect(data).to be_a(Hash)
      expect(data).to have_key(:data)

      expect(data[:data]).to have_key(:equivalent_carbon_in_kg)
      expect(data[:data][:equivalent_carbon_in_kg]).to be_a(Float)

      expect(data[:data]).to have_key(:cloverly_offset_cost)
      expect(data[:data][:cloverly_offset_cost]).to have_key(:currency)
      expect(data[:data][:cloverly_offset_cost][:currency]).to be_a(String)
      expect(data[:data][:cloverly_offset_cost]).to have_key(:total)
      expect(data[:data][:cloverly_offset_cost][:total]).to be_a(Float)
    end
  end
end

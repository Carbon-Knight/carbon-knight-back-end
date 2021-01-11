require 'rails_helper'

describe 'Create Footprint Mutation Query' do
  before :each do

    @car = Car.create(
      user_id: 1,
      make: 'Fiat',
      model: '500',
      year: 2015,
      mpg: 22,
      fuel_type: 'gasoline'
    )

  end

  it 'returns a footprint' do
    query_string = <<-GRAPHQL
      mutation {
        createFootprintAndCarMonthlyMileage(input:{
          carId: #{@car.id}
          totalMileage: 9001
          month: "June"
          year: "2077"
          }) {
            footprint {
              carbonInKg
              offsetCostTotal
              offsetCostCurrency
            }
          }
      }
    GRAPHQL

    VCR.use_cassette('vehicle_footprint_request') do
      post graphql_path, params: { query: query_string}
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(result[:data]).to be_a(Hash)
      expect(result[:data]).to have_key(:createFootprintAndCarMonthlyMileage)

      footprint_data = result[:data][:createFootprintAndCarMonthlyMileage]
      expect(footprint_data).to have_key(:footprint)

      expect(footprint_data[:footprint]).to have_key(:carbonInKg)
      expect(footprint_data[:footprint][:carbonInKg]).to be_a(Float)

      expect(footprint_data[:footprint]).to have_key(:offsetCostTotal)
      expect(footprint_data[:footprint][:offsetCostTotal]).to be_a(Float)

      expect(footprint_data[:footprint]).to have_key(:offsetCostCurrency)
      expect(footprint_data[:footprint][:offsetCostCurrency]).to be_a(String)
    end
  end
end

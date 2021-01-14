require 'rails_helper'
describe 'DeleteCarMonthlyMileage' do
  describe "As a User " do
    before :each do
      car = Car.create(id: 5, user_id: 1, make: "Chevy", model: 'Cobalt', year: 2006, mpg: 25, fuel_type: 'gasoline')

      foot = Footprint.create(id: 5, carbon_in_kg: 12444.511, offset_cost_total: 28.14, offset_cost_currency: 'USD')

      @cmm = CarMonthlyMileage.create(car_id: 5, footprint_id: 5, total_mileage: 35000, month: "March", year: "2011")
    end

    it "can delete their carbon footprint", :vcr do
      all_mileages = CarMonthlyMileage.all.length
      query_string = <<-GRAPHQL
      mutation {
        deleteCarMonthlyMileage(input:{
          id: "#{@cmm.id}"
          }) {
            id
          }
        }
        GRAPHQL

        post graphql_path, params: {query: query_string}
        result = JSON.parse(response.body, symbolize_names: true)

        expect(CarMonthlyMileage.all.length).to eq(all_mileages - 1)

        expect(result).to have_key(:data)
        expect(result[:data]).to be_a(Hash)

        expect(result[:data]).to have_key(:deleteCarMonthlyMileage)
        expect(result[:data][:deleteCarMonthlyMileage]).to be_a(Hash)

        expect(result[:data][:deleteCarMonthlyMileage]).to have_key(:id)
        expect(result[:data][:deleteCarMonthlyMileage][:id]).to eq(@cmm.id.to_s)
    end
  end
end

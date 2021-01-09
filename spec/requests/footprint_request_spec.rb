require 'rails_helper'

describe 'Car Monthly Mileage Query' do
  it 'returns car monthly mileage info based on user id' do
    car = Car.create(
      user_id: 1,
      make: 'Fiat',
      model: '500',
      year: 2015,
      mpg: 14,
      fuel_type: 'gasoline'
    )
    footprint = Footprint.new(
      carbon_in_kg: 14.4,
      offset_cost_total: 0.82,
      offset_cost_currency: 'USD'
    )
    car_monthly_mileage = CarMonthlyMileage.new(
      car_id: car.id,
      footprint_id: footprint.id,
      total_mileage: 1090,
      month: 'July',
      year: 2020
    )

    query_string = <<-GRAPHQL
      query {
        fetchUserMonthFootprint(userID: 1
          month: 'July'
          {
            carbonInKg
          }
        }
      
    GRAPHQL
  end
end

#require 'rails_helper'
#
#describe "User Query" do
#  it "returns a user based on ID" do
#    user =  User.create!(username: 'test')
#    user_id = user.id
#    query_string = <<-GRAPHQL
#      query {
#        user(id: #{user_id}) {
#          id
#          username
#        }
#      }
#      GRAPHQL
#
#      post graphql_path, params: {query: query_string}
#      result = JSON.parse(response.body)
#      expect(result).to eq({
#        "data" => {
#          "user" => {
#            "id"=>1,
#            "username"=>"test"
#          }
#        }
#      }
#    )
#  end
#end

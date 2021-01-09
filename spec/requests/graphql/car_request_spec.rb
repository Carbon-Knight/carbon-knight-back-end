require 'rails_helper'

describe "Car Query" do
  it "returns a car based on ID" do
    car =  Car.create!(user_id: 5,
                      make: 'Toyota',
                      model: 'Tacoma',
                      year: '2014',
                      mpg: 19,
                      fuel_type: 'diesel')
    car_id = car.id
    query_string = <<-GRAPHQL
    {
      car(id:6) {
        userId
        make,
        model,
        year,
        mpg,
        fuelType
      }
    }
      GRAPHQL

      post graphql_path, params: {query: query_string}
      result = JSON.parse(response.body)
      expect(result).to eq({
        "data" => {
          "user" => {
            "id"=>1,
            "username"=>"test"
          }
        }
      }
    )
  end
end
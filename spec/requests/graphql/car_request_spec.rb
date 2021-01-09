require 'rails_helper'

describe 'Car Query' do
  before :each do
    @car1 =  Car.create!(user_id: 5,
                         make: 'Toyota',
                         model: 'Tacoma',
                         year: '2014',
                         mpg: 19,
                         fuel_type: 'diesel')
    @car2 =  Car.create!(user_id: 5,
                         make: 'Honda',
                         model: 'Civic',
                         year: '2010',
                         mpg: 25,
                         fuel_type: 'gasoline')
    @car3 =  Car.create!(user_id: 6,
                         make: 'Dodge',
                         model: 'Ram',
                         year: '2019',
                         mpg: 15,
                         fuel_type: 'diesel')
  end

  it 'returns a car based on ID' do
    car_id = @car1.id
    query_string = <<-GRAPHQL
    {
      car(id:#{car_id}) {
        userId
        make,
        model,
        year,
        mpg,
        fuelType
      }
    }
    GRAPHQL

    post graphql_path, params: { query: query_string }
    result = JSON.parse(response.body)
    expect(result).to eq({
                           'data' => {
                             'car' => {
                               'userId' => 5,
                               'make' => 'Toyota',
                               'model' => 'Tacoma',
                               'year' => 2014,
                               'mpg' => 19,
                               'fuelType' => 'diesel'
                             }
                           }
                         })
  end

  it 'returns all cars in the db' do
    query_string = <<-GRAPHQL
    {
      cars {
        userId
        make,
        model,
        year,
        mpg,
        fuelType
      }
    }
    GRAPHQL

    post graphql_path, params: { query: query_string }
    result = JSON.parse(response.body)
    expect(result).to eq({
                           'data' => {
                             'cars' => [{
                               'userId' => 5,
                               'make' => 'Toyota',
                               'model' => 'Tacoma',
                               'year' => 2014,
                               'mpg' => 19,
                               'fuelType' => 'diesel'
                             },
                              {
                                'userId' => 5,
                                'make' => 'Honda',
                                'model' => 'Civic',
                                'year' => 2010,
                                'mpg' => 25,
                                'fuelType' => 'gasoline'
                              },
                              {
                                'userId' => 6,
                                'make' => 'Dodge',
                                'model' => 'Ram',
                                'year' => 2019,
                                'mpg' => 15,
                                'fuelType' => 'diesel'
                              }]
                           }
                         })
  end

  it 'returns all cars for a user' do
    query_string = <<-GRAPHQL
    {
      fetchUserCars(userId:5) {
        userId
        make,
        model,
        year,
        mpg,
        fuelType
      }
    }
    GRAPHQL

    post graphql_path, params: { query: query_string }
    result = JSON.parse(response.body)
    expect(result).to eq({
                           'data' => {
                             'fetchUserCars' => [{
                               'userId' => 5,
                               'make' => 'Toyota',
                               'model' => 'Tacoma',
                               'year' => 2014,
                               'mpg' => 19,
                               'fuelType' => 'diesel'
                             },
                              {
                                'userId' => 5,
                                'make' => 'Honda',
                                'model' => 'Civic',
                                'year' => 2010,
                                'mpg' => 25,
                                'fuelType' => 'gasoline'
                              }]
                           }
                         })
  end
end

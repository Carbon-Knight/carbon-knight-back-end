require 'rails_helper'

describe 'Create user car' do
  describe 'with valid params' do
    it 'it creates a car for that user' do
      query_string = <<-GRAPHQL
      mutation {
        createUserCar(input:{
          userId: 2,
          make: "Toyota",
          model: "Tacoma",
          year: 2014,
          mpg: 19,
          fuelType: "diesel"
        }) {
          createdCar {
            userId,
            make,
            model,
            year,
            mpg,
            fuelType
          }
          errors
        }}
      GRAPHQL

      post graphql_path, params: { query: query_string }
      result = JSON.parse(response.body)
      expect(result).to eq({
                             'data' => {
                               'createUserCar' => {
                                 'createdCar' => {
                                   'userId' => 2,
                                   'make' => 'Toyota',
                                   'model' => 'Tacoma',
                                   'year' => 2014,
                                   'mpg' => 19,
                                   'fuelType' => 'diesel'
                                 },
                                 'errors' => []
                               }
                             }
                           })
    end
  end

  describe 'with invalid params' do
    it 'returns an error' do
      query_string = <<-GRAPHQL
      mutation {
        createUserCar(input:{
          userId: 2,
          mpg: 19,
        }) {
          createdCar {
            userId,
            make,
            model,
            year,
            mpg,
            fuelType
          }
          errors
        }}
      GRAPHQL

      post graphql_path, params: { query: query_string }
      result = JSON.parse(response.body)
      
      expect(result).to have_key('errors')
      expect(result['errors']).to be_an(Array)
      expect(result['errors'][0]).to have_key('message')
      expect(result['errors'][0]['message']).to eq(
        "Argument 'make' on InputObject 'CreateUserCarInput' is required. Expected type String!"
      )

      expect(result['errors'][1]['message']).to eq(
        "Argument 'model' on InputObject 'CreateUserCarInput' is required. Expected type String!"
      )

      expect(result['errors'][2]['message']).to eq(
        "Argument 'year' on InputObject 'CreateUserCarInput' is required. Expected type Int!"
      )
      expect(result['errors'][3]['message']).to eq(
        "Argument 'fuelType' on InputObject 'CreateUserCarInput' is required. Expected type String!"
      )
    end
  end
end

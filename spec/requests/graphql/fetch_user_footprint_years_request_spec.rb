require 'rails_helper'

describe 'Fetch all years where a user had a carbon footprint' do
  it 'can fetch years for a user' do
    user_id = 1
    car_1 =
    query_string = <<-GRAPHQL
      query {
        fetchUserFootprintYears(userId: #{user_id}){
          years
          }
        }
    GRAPHQL

    post graphql_path, params: { query: query_string}
    result = JSON.parse(response.body, symbolize_names: true)

    
  end
end

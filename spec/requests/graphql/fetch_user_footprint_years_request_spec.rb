require 'rails_helper'

describe 'Fetch all years where a user had a carbon footprint' do
  it 'can fetch years for a user' do
    user_id = 1
    other_user_id = 2

    user_cars = create_list(:car, 2, :with_records, user_id: user_id)
    other_cars = create_list(:car, 2, :with_records, user_id: other_user_id)

    query_string = <<-GRAPHQL
      query {
        fetchUserFootprintYears(userId: #{user_id}){
          years
        }
      }
    GRAPHQL

    post graphql_path, params: { query: query_string}

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to be_a Hash
    expect(result).to have_key :data
    expect(result[:data]).to be_a Hash

    data = result[:data]

    expect(data).to have_key :fetchUserFootprintYears
    expect(data[:fetchUserFootprintYears]).to be_a Hash
    
    expect(data[:fetchUserFootprintYears]).to have_key :years
    expect(data[:fetchUserFootprintYears][:years]).to  be_an Array
    expect(data[:fetchUserFootprintYears][:years]).to eq CarMonthlyMileage.fetch_user_years(user_id)
  end
end

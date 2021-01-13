require 'rails_helper'

RSpec.describe Footprint, type: :model do
  describe 'validations' do
     it { should validate_presence_of :carbon_in_kg }
     it { should validate_presence_of :offset_cost_total }
     it { should validate_presence_of :offset_cost_currency }
  end

  describe "Class Methods" do
    it "aggregate_footprint_for_year returns a hash with footprints for the months there is data for" do
      car_1 = Car.create(
        user_id: 1,
        make: 'Fiat',
        model: '500',
        year: 2015,
        mpg: 14,
        fuel_type: 'gasoline'
      )

      car_2 = Car.create(
        user_id: 1,
        make: 'Audi',
        model: 'A8',
        year: 2016,
        mpg: 28,
        fuel_type: 'gasoline'
      )

      footprint_1 = Footprint.create(
        carbon_in_kg: 20.1,
        offset_cost_total: 0.82,
        offset_cost_currency: 'USD'
      )

      footprint_2 = Footprint.create(
        carbon_in_kg: 28.6,
        offset_cost_total: 1.82,
        offset_cost_currency: 'USD'
      )

      footprint_3 = Footprint.create(
        carbon_in_kg: 28.6,
        offset_cost_total: 1.82,
        offset_cost_currency: 'USD'
      )

      CarMonthlyMileage.create(
        car_id: car_1.id,
        footprint_id: footprint_1.id,
        total_mileage: 1090,
        month: 'March',
        year: 2020
      )

      CarMonthlyMileage.create(
        car_id: car_2.id,
        footprint_id: footprint_2.id,
        total_mileage: 1090,
        month: 'June',
        year: 2020
      )

      CarMonthlyMileage.create(
        car_id: car_2.id,
        footprint_id: footprint_3.id,
        total_mileage: 1090,
        month: 'January',
        year: 2020
      )
      result = Footprint.aggregate_footprint_for_year(1, 2020)

      expect(result).to be_a(Hash)
      expect(result['January']).to eq(28.6)
      expect(result['June']).to eq(28.6)
      expect(result['March']).to eq(20.1)
    end
  end
end

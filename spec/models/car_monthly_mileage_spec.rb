require 'rails_helper'

RSpec.describe CarMonthlyMileage, type: :model do
  describe 'validations' do
     it { should validate_presence_of :car_id }
     it { should validate_presence_of :footprint_id }
     it { should validate_presence_of :total_mileage }
     it { should validate_presence_of :month }
     it { should validate_presence_of :year }
  end

  describe 'relationships' do
    it { should belong_to :car }
    it { should belong_to :footprint }
  end

  describe 'methods' do
    it "can return all car monthly mileages for a user" do
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

      expected_1 = CarMonthlyMileage.create(
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

      expected_2 = CarMonthlyMileage.create(
        car_id: car_2.id,
        footprint_id: footprint_3.id,
        total_mileage: 1090,
        month: 'January',
        year: 2020
      )

      all_mileages = CarMonthlyMileage.fetch_all_user_car_monthly_mileages(1)

      expect(all_mileages.first).to be_a(CarMonthlyMileage)
      expect(all_mileages.first.id).to eq(expected_1.id)
      expect(all_mileages.first.year).to eq(expected_1.year)
      expect(all_mileages.first.car_id).to eq(expected_1.car_id)
      expect(all_mileages.first.month).to eq(expected_1.month)
      expect(all_mileages.first.footprint_id).to eq(expected_1.footprint_id)
      expect(all_mileages.first.total_mileage).to eq(expected_1.total_mileage)

      expect(all_mileages.last).to be_a(CarMonthlyMileage)
      expect(all_mileages.last.id).to eq(expected_2.id)
      expect(all_mileages.last.year).to eq(expected_2.year)
      expect(all_mileages.last.car_id).to eq(expected_2.car_id)
      expect(all_mileages.last.month).to eq(expected_2.month)
      expect(all_mileages.last.footprint_id).to eq(expected_2.footprint_id)
      expect(all_mileages.last.total_mileage).to eq(expected_2.total_mileage)
    end

    it 'can return all unique years where a user recorded a footprint' do
      user_id = 1
      other_user_id = 2

      user_cars = create_list(:car, 2, :with_records, user_id: user_id)
      other_cars = create_list(:car, 2, :with_records, user_id: other_user_id)

      user_monthly_mileages = user_cars.map(&:car_monthly_mileages).flatten

      user_years = CarMonthlyMileage.fetch_user_years(user_id)
      expected_years = user_monthly_mileages.map(&:year).uniq.sort

      expect(user_years).to eq expected_years
    end
  end
end

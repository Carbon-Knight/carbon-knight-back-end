require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :make }
    it { should validate_presence_of :model }
    it { should validate_presence_of :year }
    it { should validate_presence_of :mpg }
    it { should validate_presence_of :fuel_type }
  end

  describe "relationships" do
    it { should have_many :car_monthly_mileages }
  end

  describe 'object methods' do
    it 'recorded_years' do
      binding.pry
      car = create(:car, :with_records)

    end
  end
end

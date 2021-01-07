require 'rails_helper'

RSpec.describe CarMonthlyMileage, type: :model do
  describe 'validations' do
     it { should validate_presence_of :car_id }
     it { should validate_presence_of :total_mileage }
     it { should validate_presence_of :month }
     it { should validate_presence_of :year }
  end

  describe 'relationships' do
    it { should belong_to :car }
    it { should have_one :footprint }
  end
end

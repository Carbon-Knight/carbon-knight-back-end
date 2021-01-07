require 'rails_helper'

RSpec.describe Footprint, type: :model do
  describe 'validations' do
     it { should validate_presence_of :carbon_in_kg }
     it { should validate_presence_of :offset_cost_total }
     it { should validate_presence_of :offset_cost_currency }
  end
end

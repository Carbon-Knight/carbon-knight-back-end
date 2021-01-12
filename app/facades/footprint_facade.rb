class FootprintFacade
  class << self
    def create_footprint(car, mileage)
      response = FootprintService.vehicle_footprint(car, mileage)[:data]
      Footprint.create(
        carbon_in_kg: response[:equivalent_carbon_in_kg],
        offset_cost_total: response[:cloverly_offset_cost][:total],
        offset_cost_currency: response[:cloverly_offset_cost][:currency]
      )
    end
  end
end

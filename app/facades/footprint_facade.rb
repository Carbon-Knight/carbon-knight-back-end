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

    def update_footprint(car_monthly_mileage)
      response = FootprintService.vehicle_footprint(car_monthly_mileage.car, car_monthly_mileage.total_mileage)[:data]

      car_monthly_mileage.footprint.update(
        carbon_in_kg: response[:equivalent_carbon_in_kg],
        offset_cost_total: response[:cloverly_offset_cost][:total],
        offset_cost_currency: response[:cloverly_offset_cost][:currency]
      )
    end
  end
end

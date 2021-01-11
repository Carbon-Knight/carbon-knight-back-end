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

    def aggregate_footprint_for_month(user_id, month, year)
      aggregate_footprint = CarMonthlyMileage.joins(:car, :footprint)
      .select("user_id","carbon_in_kg")
      .where("LOWER(month) = ?", "#{month.downcase}")
      .where(year: year, cars: {user_id: user_id})
      .sum("carbon_in_kg")

      {carbon_in_kg: aggregate_footprint}
    end
  end
end

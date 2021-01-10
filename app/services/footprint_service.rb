class FootprintService
  class << self
    def vehicle_footprint(car, mileage)
      response = conn.get("/api/v1/carbonfootprint?fuel_efficiency=#{car.mpg}&trip_distance=#{mileage}&fuel_type=#{car.fuel_type}")
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new(url: 'https://cloverly-microservice.herokuapp.com')
    end
  end
end

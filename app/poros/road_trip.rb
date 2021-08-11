class RoadTrip
  attr_reader :origin,
              :destination,
              :travel_time,
              :temperature,
              :conditions

  def initialize(trip_data)
    @origin =      trip_data[:origin]
    @destination = trip_data[:destination]
    @travel_time = time_format(trip_data)
    @temperature = trip_data[:weather_eta].temperature
    @conditions =  trip_data[:weather_eta].conditions
  end

  def time_format(trip_data)
    hour = trip_data[:travel_time].split(':')[0]
    min = trip_data[:travel_time].split(':')[1]
    "#{hour} hours, #{min} minutes"
  end
end

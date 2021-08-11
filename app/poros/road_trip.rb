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
    @temperature = arrival_temp(trip_data)
    @conditions =  arrival_cond(trip_data)
  end

  def time_format(trip_data)
    if trip_data[:travel_time].nil?
      "Impossible"
    else
      hour = trip_data[:travel_time].split(':')[0]
      min = trip_data[:travel_time].split(':')[1]
      "#{hour} hours, #{min} minutes"
    end
  end

  def arrival_temp(trip_data)
    if trip_data[:travel_time].nil?
      trip_data[:weather_eta] = nil
    else
      trip_data[:weather_eta].temperature
    end
  end

  def arrival_cond(trip_data)
    if trip_data[:travel_time].nil?
      trip_data[:weather_eta] = nil
    else
      trip_data[:weather_eta].conditions
    end
  end
end

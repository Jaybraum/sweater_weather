class RoadTripSerializer < ActiveModel::Serializer
  attributes :start_city, :end_city

  def self.details(data)
    {
      data:
      {
        id: nil,
        type: "roadtrip",
        attributes:
        {
          start_city: data.origin,
          end_city: data.destination,
          travel_time: data.travel_time,
          weather_at_eta:
          {
            temperature: data.temperature,
            conditions: data.conditions
          }
        }
      }
    }.to_json
  end
end

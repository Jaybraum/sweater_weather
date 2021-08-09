class BreweriesSerializer < ActiveModel::Serializer
  attributes :id, :destination, :summary, :temperature, :brewery_type

  def self.details(data, location, quantity)
  {
    data:
    {
      id: nil,
      type: 'breweries',
      attributes:
      {
        destination: location,
        forecast:
        {
          summary: data[0].current.conditions,
          temperature: data[0].current.temperature,
        },
        breweries:
        data.second.first(quantity).map do |data|
        [
          {
          id: data[:id],
          name: data[:name],
          brewery_type: data[:brewery_type]
        }
        ]end
      }
  }
}.to_json
  end
end

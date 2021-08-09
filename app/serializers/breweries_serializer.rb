class BreweriesSerializer < ActiveModel::Serializer
  attributes :id, :destination, :summary, :temperature, :brewery_type

  def self.details(data, location)
  {
    data:
    data.map do |data|
    {
      id: nil,
      type: 'breweries',
      attributes:
      {
        destination: location,
        forecast:
        {
          summary: data.current.conditions,
          temperature: data.current.temperature,
        },
        breweries:
        data.map do |k, v |
          require "pry"; binding.pry
        [
          {
          id: data[1][:id],
          name: data[1][:name],
          brewery_type: data[1][:brewery_type]
        }
        ]end
      }
  }end
}.to_json
  end
end

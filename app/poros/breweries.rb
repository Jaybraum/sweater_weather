class Breweries
  attr_reader :id, :name, :brewery_type

  def initialize(details)
    @id = details[:id]
    @name = details[:name]
    @brewery_type = details[:brewery_type]
  end
end

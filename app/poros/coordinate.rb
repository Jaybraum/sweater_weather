class Coordinate
  attr_reader :lat, :lng

  def initialize(coordinate_details)
    @lat = coordinate_details[:latLng][:lat]
    @lng = coordinate_details[:latLng][:lng]
  end
end

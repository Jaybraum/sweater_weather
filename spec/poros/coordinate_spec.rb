require "rails_helper"

RSpec.describe Coordinate do
  describe '#initialize' do
    it 'encapsulates coordinates into object' do
    coordinate_details = {
      :latLng=>
      {
        :lat=>40.692529,
        :lng=>-73.990996
      }
      }

    coordinate = Coordinate.new(coordinate_details)

    expect(coordinate).to be_a(Coordinate)
    expect(coordinate.lng).to be_a(Float)
    expect(coordinate.lat).to be_a(Float)
    expect(coordinate.lat).to eq(40.692529)
    expect(coordinate.lng).to eq(-73.990996)
  end
end

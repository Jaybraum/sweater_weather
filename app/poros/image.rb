class Image
  attr_reader :location,
              :image_url,
              :description,
              :author

  def initialize(image)
    #require "pry"; binding.pry
    @location   = image[:location]
    @description = image[:description]
    @image_url =   image[:image_url]
    @author =      image[:author]
  end
end

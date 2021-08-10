class Image
  attr_reader :description,
              :image_url,
              :author

  def initialize(image)
    @description = image[:description]
    @image_url =   image[:urls][:regular]
    @author =      image[:user][:username]
  end
end

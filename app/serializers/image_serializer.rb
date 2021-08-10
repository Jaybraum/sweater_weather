class ImageSerializer < ActiveModel::Serializer
  attributes :author, :image_url, :description

  def self.details(data, location)
    {
      data:
      {
        id: nil,
        type: 'image',
        attributes: {
          image:
          {
            location: location,
            image_url: data.first.image_url,
            description: data.first.description
          },
          credit:
          {
            source: 'unsplash.com',
            author: data.first.author
          }
        }
      }
    }.to_json
  end
end

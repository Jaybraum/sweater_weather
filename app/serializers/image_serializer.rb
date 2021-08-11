class ImageSerializer < ActiveModel::Serializer
  attributes :author, :image_url, :description, :location

  def self.details(data)
    {
      data:
      {
        id: nil,
        type: 'image',
        attributes: {
          image:
          {
            location: data.location,
            image_url: data.image_url,
            description: data.description
          },
          credit:
          {
            source: 'unsplash.com',
            author: data.author
          }
        }
      }
    }.to_json
  end
end

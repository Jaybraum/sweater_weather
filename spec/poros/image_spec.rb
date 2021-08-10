require 'rails_helper'

RSpec.describe Image do
  describe '#initialize' do
    it 'encapsulates Image data into object' do
      image_details = {
        :id=>"iD-mlXEQT9s",
        :created_at=>"2020-11-12T09:58:15-05:00",
        :updated_at=>"2021-08-09T15:23:22-04:00",
        :promoted_at=>nil,
        :width=>5184,
        :height=>3456,
        :color=>"#402626",
        :blur_hash=>"LUG@=KxaIoRk~BsSkDa{?IR*oIs:",
        :description=>"Rooftop Sunrise Skyline View, Brooklyn, New York City",
        :alt_description=>"brown and white concrete building during daytime",
        :urls=> {
          :regular=> "https://images.unsplash.com/photo-1605192396298-0e70f25c85da?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI3MDd8MHwxfHNlYXJjaHwxfHxCcm9va2x5biUyQ05ZfGVufDB8MHx8fDE2Mjg2Mj
          A0NzA&ixlib=rb-1.2.1&q=85"
        },
        :user=> {
          :id=>"ZtLjPRfGIak",
          :updated_at=>"2021-08-02T05:47:22-04:00",
          :username=>"josharmstrong",
          :name=>"Joshua Armstrong",}
        }

        image = Image.new(image_details)

        expect(image).to be_an(Image)
        expect(image.description).to be_a(String)
        expect(image.image_url).to be_a(String)
        expect(image.author).to be_a(String)
    end
  end
end

class UnsplashService
  def self.get_photo_details(location)
    response = conn.get("photos?query=#{location}&page=1&per_page=1&orientation=landscape")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/search/') do |req|
      req.headers['Authorization'] = ENV['UNSPLASH_KEY']
    end
  end

  private_class_method :conn
end

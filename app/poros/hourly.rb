class Hourly
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(weather)
    @time = Time.at(weather[:dt]).to_s
    @temperature = weather[:temp]
    @conditions = weather[:weather][0][:description]
    @icon = weather[:weather][0][:icon]
  end
end

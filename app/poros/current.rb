class Current
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(weather)
    @datetime = weather[:dt]
    @sunrise = weather[:sunrise]
    @sunset = weather[:sunset]
    @temperature = weather[:temp]
    @feels_like = weather[:feels_like]
    @humidity = weather[:humidity]
    @uvi = weather[:uvi]
    @visibility = weather[:visibility]
    @conditions = weather[:weather][0][:description]
    @icon = weather[:weather][0][:icon]
  end
end

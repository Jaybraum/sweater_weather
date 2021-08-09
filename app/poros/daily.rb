class Daily
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :humidity,
              :conditions,
              :icon

  def initialize(weather)
    @date = Time.at(weather[:dt]).to_s
    @sunrise = Time.at(weather[:sunrise]).to_s
    @sunset = Time.at(weather[:sunset]).to_s
    @max_temp = weather[:temp][:min]
    @min_temp = weather[:temp][:max]
    @humidity = weather[:humidity]
    @conditions = weather[:weather][0][:description]
    @icon = weather[:weather][0][:icon]
  end
end

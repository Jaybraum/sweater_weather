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
    @date = weather[:dt]
    @sunrise = weather[:sunrise]
    @sunset = weather[:sunset]
    @max_temp = weather[:max_temp]
    @min_temp = weather[:min_temp]
    @humidity = weather[:humidity]
    @conditions = weather[:weather][0][:description]
    @icon = weather[:weather][0][:icon]
  end
end

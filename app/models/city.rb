require 'pry'

class City < ActiveRecord::Base
  has_many :city_weathers
  has_many :weathers, through: :city_weathers

  def city_weather_all_forecast #returns array of CityWeather instances for today and future dates (ALL CITIES)
    CityWeather.all.select do |cw|
      now = DateTime.now
      now2 = now.change(hour: 0, offset: 0)
      split = cw["date"].split("-")
      converted_time1 = DateTime.new
      converted_time2 = converted_time1.change(year: split[0].to_i, month: split[1].to_i, day: split[2].to_i)
      converted_time2 >= now2
    end
  end

  def my_weather #returns an array of all weather instances from today forward
    city_weather_all_forecast.select do |date|
      date.city_id == self.id
    end
  end

  def average_high #returns integer in C of average high
    sum = 0
    counter = 0
    self.my_weather.each do |date|
      sum += date["daily_high"]
      counter += 1
    end
    return (sum/counter).to_i
  end

  def average_low #returns integer in C of average low
    sum = 0
    counter = 0
    self.my_weather.each do |date|
      sum += date["daily_low"]
      counter += 1
    end
    return (sum/counter).to_i
  end

  def max_temp #returns CityWeather instance of highest temperature
    max = self.my_weather.max do |date|
      date["daily_high"]
    end
  end

  def min_temp #returns CityWeather instance of lowest temperature
    min = self.my_weather.min do |date|
      date["daily_low"]
    end
  end

  def temp_range #returns integer of temperature in Celsius
    hi = self.max_temp["daily_high"].to_i
    low = self.min_temp["daily_low"].to_i
    range = hi - low
    range
  end

  # "
  # Weekly high is #{hi_temp}
  # Weekly low is #{low_temp}
  # Weekly range is #{range}"

end #class City

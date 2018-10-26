require_relative '../config/environment'
require 'pry'

def day_length(today) #puts string of hours and minutes of daylight
  sun_rise = today["sun_rise"]
  sun_set = today["sun_set"]
  sr1 = sun_rise.split(/[T.]/)[1]
  ss1 = sun_set.split(/[T.]/)[1]
  sr2 = sr1.split(":")
  ss2 = ss1.split(":")
  hour = ss2[0].to_i - sr2[0].to_i
  min = (60 - sr2[1].to_i) + (ss2[1].to_i)
  if min > 60
    hour += 1
    min -= 60
  end
  puts "#{hour} hours and #{min} minutes of daylight."
end

def least_rain_forecast #returns an array of cities & number of rainy days
  rain_hash = {}
  city_weather_today_and_forecast.each do |cw|
    if rain_hash[cw.city["name"]] == nil
      rain_hash[cw.city["name"]] = 0
    end
    if ["Heavy Rain","Light Rain","Showers","Thunder"].include?(cw.weather["weather_type"])
      rain_hash[cw.city["name"]] += 1
    end
  end
  sorted_rain_array = rain_hash.sort_by { |k,v| v }
  sorted_rain_array
end

def least_rain_display(least_rain_forecast)
  puts "The destinations with the least rain this coming week are:\n\n"
  least_rain_forecast.take(3).each do |e|
    if e[1] == 0
      puts "#{e[0]} - no rain this week! 🙂"
    elsif e[1] == 1
      puts "#{e[0]} - 1 day of rain. 🌧"
    else
      puts "#{e[0]} - #{e[1]} days of rain. 🌧"
    end
  end
end

def most_sunlight
end

def city_weather_today_and_forecast #returns CityWeather for today and future dates
  CityWeather.all.select do |cw|
    now = DateTime.now
    now2 = now.change(hour: 0, offset: 0)
    split = cw["date"].split("-")
    converted_time1 = DateTime.new
    converted_time2 = converted_time1.change(year: split[0].to_i, month: split[1].to_i, day: split[2].to_i)
    converted_time2 >= now2
  end
end

def hottest_day #will find hottest day instance in the next 6 days
  city_weather_today_and_forecast.max_by do |cw|
    cw["daily_high"]
  end
end

#hottest_day.city["name"] will return city name with hottest day
#calculate average for week

def coolest_day
  city_weather_today_and_forecast.min_by do |cw|
    cw["daily_high"]
  end
end

#coolest_day.city["name"] will return city name with coolest day

def longest_day_length
end

def today_weather(current_city) #returns CityWeather instance for passed in city
  now = DateTime.now
  current_city.city_weathers.find do |cw|
    cw["date"] == "#{now.year}-#{now.month}-#{now.day}"
  end
end

def tomorrow_weather(current_city) #returns CityWeather instance for passed in city
  tomorrow = DateTime.now + 1
  current_city.city_weathers.find do |cw|
    cw["date"] == "#{tomorrow.year}-#{tomorrow.month}-#{tomorrow.day}"
  end
end

def dt_conversion(string)
  split = string.split("-")
  converted_time1 = DateTime.new
  converted_time2 = converted_time1.change(year: split[0].to_i, month: split[1].to_i, day: split[2].to_i)
  converted_time2
end

def latest_sunset
 latest_sunset = "0"
 sunset_city = ''
 city_weather_today_and_forecast.select do |cw|
   sunset_time = cw.sun_set.split(/[T.]/)[1]
   if sunset_time > latest_sunset
     latest_sunset = sunset_time
     sunset_city = cw.city[:name]
   end
 end
 sun_split = latest_sunset.split(":")
 puts "The destination with the latest sunset is:\n\n
 #{sunset_city} - #{sun_split[0].to_i - 12}:#{sun_split[1]} PM  🌅
 "
end

def conv_c_to_f(c)
  f = ( c * 9 / 5) + 32
  f.to_i
end

require 'pry'

def greet_user
  puts '================================================'
  puts 'Hello! Welcome to the Weather Destination App 🌞'.colorize(color: :white, background: :blue)
  puts "================================================\n\n"
end

def menu
  puts "Please select one of the following cities by number:\n
  1. New York 🗽
  2. Cape Town
  3. Rio De Janeiro
  4. Cairo
  5. Singapore
  6. Barcelona
  "
end

# user picks a city

# display city weather for THAT DAY and the WEEK FORECAST

def menu2 # This will come after we display city specific data
  puts "\nPlease select from one of the following options:\n
  Find which city...\n
  1. ...has the hottest forecast
  2. ...has the coolest forecast
  3. ...will have the least rainy forecast
  4. ...will have the most sunlight
  5. ...will have the latest sunset
  6. ...has the hottest days and coldest nights\n

  7. Return to main menu to select another city.
  8. Exit.
  "
end

def menu3 # where we show aggregate data

end

def exit_weather_app
  puts "Goodbye! 👋"
end

# binding.pry

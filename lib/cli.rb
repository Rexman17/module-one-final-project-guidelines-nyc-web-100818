require 'pry'

def greet_user
  puts '================================================'
  puts 'Hello! Welcome to the Weather Destination App 🌞'.colorize(color: :white, background: :blue)
  puts "================================================\n\n"
end

def menu
  puts "Please select one of the following cities by number:\n
  1. New York 🇺🇸 🗽
  2. Cape Town 🇿🇦
  3. Rio De Janeiro 🇧🇷
  4. Cairo 🇪🇬
  5. Singapore 🇸🇬
  6. Barcelona 🇪🇸
  "
end

# user picks a city

# display city weather for THAT DAY and the WEEK FORECAST

def menu2 # This will come after we display city specific data
  puts '================================================'
  puts 'Destination Research:'
  puts "================================================\n\n"
  puts "\nPlease select from one of the following options:\n

  1. Destination with the hottest forecast
  2. Destination with the coolest forecast
  3. Destinations with the least rain
  4. Destination with the latest sunset

  5. Return to main menu to select another city.
  6. Exit.
  "
end

def menu3 # where we show aggregate data

end

def exit_weather_app
  puts "\nGoodbye! 👋\n\n"
end


# binding.pry

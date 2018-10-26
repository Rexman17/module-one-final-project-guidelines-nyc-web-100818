require_relative '../config/environment'

def menu1_method_wrapper
  menu
  api = API.new

  selection = api.city_selection
  hash = api.get_response(selection)
  api.populate_db(hash)
  current_city = api.selected_city(selection)
  today = today_weather(current_city)
  api.city_today_info(current_city, today)
  api.week_forecast(current_city)
  sleep(2)
end

# def menu2_method_wrapper
#   menu2 # ask if they want to choose another city, see data across cities, or exit
#     puts "INSIDE WHILE STATEMENT"
#     user_input = gets.chomp.to_i
#   while user_input
#     case user_input.to_i
#       when 1 # go back to first menu
#         menu1_method_wrapper
#         menu2
#         break
#       when 2 # go to aggregate weather info page
#         # we don't have this yet
#         puts "HEEEEEEEEEEEEEEEEEEEEY"
#         binding.pry
#         menu3
#         break
#       when 3
#         "\n"
#         exit_weather_app # calling this method in cli.rb
#       break
#     end
#   end
# end

def prompt_user(prompt)
  while prompt
    case prompt
      when 1
        puts "The city with the hottest forecast is:\n\n
        #{hottest_day.city["name"]}\n
        "
        sleep(2)
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 2
        puts "The city with the coolest forecast is:\n\n
        #{coolest_day.city["name"]}\n
        "
        sleep(2)
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 3
        least_rain_forecast
        sleep(2)
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 5
        latest_sunset # reformat time?
        sleep(2)
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 7 # go back to first menu
        menu1_method_wrapper
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      # when 8 # go to aggregate weather info page
      #   # we don't have this yet
      #   binding.pry
      #   menu3
      #   break
      when 8
        "\n"
        exit_weather_app # calling this method in cli.rb
      break
    end
  end
end


greet_user #should only run once
menu1_method_wrapper
menu2
user_input = gets.chomp.to_i
prompt_user(user_input)
latest_sunset

binding.pry

puts "END"

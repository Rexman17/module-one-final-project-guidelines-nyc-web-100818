require_relative '../config/environment'

def continue_prompt
  user_input = 0
  while user_input != "1"
    puts "\nPress '1' to continue"
    user_input = gets.chomp
  end
end


def menu1_method_wrapper
  menu
  api = API.new

  selection = api.city_selection
  hash = api.get_response(selection)
  api.populate_db(hash)
  current_city = api.selected_city(selection)
  today = today_weather(current_city)
  tomorrow = tomorrow_weather(current_city)
  api.city_today_info(current_city, today, tomorrow)
  api.week_forecast(current_city)
  user_input = 0
  continue_prompt
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

        puts "The destination with the hottest forecast is:\n\n
        #{hottest_day.city["name"]} - #{conv_c_to_f(hottest_day['daily_high'])} ºF 🔴\n
        "
        continue_prompt
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 2
        puts "The destination with the coolest forecast is:\n\n
        #{coolest_day.city["name"]} - #{conv_c_to_f(coolest_day['daily_high'])} ºF 🔵\n
        "
        continue_prompt
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 3
        least_rain_forecast
        least_rain_display(least_rain_forecast)
        continue_prompt
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 4
        latest_sunset # reformat time?
        continue_prompt
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 5 # go back to first menu
        menu1_method_wrapper
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
      when 6
        "\n"
        exit_weather_app # calling this method in cli.rb
        break
      else
        puts "Please choose a valid option.".colorize(color: :white, background: :red)
        puts "\n"
        menu2
        input = gets.chomp.to_i
        prompt_user(input)
        break
    end
  end
end


greet_user #should only run once
menu1_method_wrapper
menu2
user_input = gets.chomp.to_i
prompt_user(user_input)

# binding.pry

require 'daily_weather'

namespace :weather do
  desc "Gets new betting options for tomorrow"
  task daily_weather: :environment do
    DailyWeather.get_weather
  end
end
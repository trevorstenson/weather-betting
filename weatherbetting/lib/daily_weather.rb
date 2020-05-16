require "net/http"

class DailyWeather
    @@API_URL = "https://api.weather.gov/gridpoints/"
    @@locations = { "Boston, MA" => ["TOP", "70,76"], "Seattle, WA" => ["SEW", "124,67"], "Los Angeles, CA" => ["LOX", "154,44"] }

    def self.get_weather
        tomorrow = Time.now.utc.to_date + 1
        if !TemperatureBet.exists?(date: tomorrow)
            @@locations.each do |key, value|
                weather_json = get_data(value)
                tomorrow_low, tomorrow_high = extract_temps(weather_json)
                TemperatureBet.create(location: key, date: tomorrow, high: tomorrow_high, low: tomorrow_low, over_high_points: 0, under_high_points: 0, over_low_points: 0, under_low_points: 0)
            end
        end
    end

    private

    def self.extract_temps(data)
        high = data["properties"]["periods"][2]["temperature"]
        low = data["properties"]["periods"][3]["temperature"]
        return low, high
    end

    def self.get_data(value)
        response = Net::HTTP.get_response(URI(@@API_URL + value[0] + "/" + value[1] + "/forecast"))
        if response.code == '200'
            JSON.parse(response.body)
        else
            raise "Request failed."
        end
    end
end
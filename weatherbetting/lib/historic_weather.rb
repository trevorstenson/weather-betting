require "net/http"

class HistoricWeather
    @@API_KEY = "24QTi4iZyyYcV3qWxUlPxG8oYzG1iqpm"
    @@API_URL = "https://api.climacell.co/v3/weather/historical/station"
    @@locations = { "Boston, MA" => ["42.361145", "-71.057083", "-05:00"], "Seattle, WA" => ["47.608013", "-122.335167", "-07:00"], "Los Angeles, CA" => ["34.052235", "-118.243683", "-07:00"] }

    def get_temps(loc, date)
        day_weather_json = get_data(@@locations[loc][0], @@locations[loc][1], date, build_start_datetime(loc, date), build_middle_datetime(loc, date))
        day_low, day_high = extract_temps(day_weather_json)
        night_weather_json = get_data(@@locations[loc][0], @@locations[loc][1], date, build_middle_datetime(loc, date), build_end_datetime(loc, date))
        night_low, night_high = extract_temps(night_weather_json)
        return day_low, day_high, night_low, night_high
    end

    private

    def get_data(lat, lon, date, start_time, end_time)
        uri = URI(@@API_URL + "?lat=" + lat + "&lon=" + lon + "&unit_system=us&start_time=" + start_time + "&end_time=" + end_time + "&fields=temp&apikey=" + @@API_KEY)
        response = Net::HTTP.get_response(uri)
        if response.code == '200'
            JSON.parse(response.body)
        else
            raise "Request failed."
        end
    end

    def extract_temps(data)
        low = data.min_by{|x| x["temp"]["value"]}["temp"]["value"]
        high = data.max_by{|x| x["temp"]["value"]}["temp"]["value"]
        return low, high
    end

    def build_start_datetime(loc, date)
        return date.to_s + "T06:00:00" + @@locations[loc][2]
    end

    def build_middle_datetime(loc, date)
        return date.to_s + "T18:00:00" + @@locations[loc][2]
    end

    def build_end_datetime(loc, date)
        return (date + 1).to_s + "T06:00:00" + @@locations[loc][2]
    end
end

hw = HistoricWeather.new
puts hw.get_temps("Boston, MA", Date.today - 2)
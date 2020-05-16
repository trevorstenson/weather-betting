require "historic_weather"

class WagerResolver
    def self.resolve_wagers
        puts "YOOOO"
        curr_date = Time.now.utc.to_date
        completed_temp_games = TemperatureBet.where("date <= ?", curr_date)
        completed_temp_games.each do |game|
            resolve_game(game)
        end
        if Time.now.utc > Time.now.utc.beginning_of_day + 18.hours
            curr_date = Time.now.utc.to_date
            completed_temp_games = TemperatureBet.where("date <= ?", curr_date)
            completed_temp_games.each do |game|
                resolve_game(game)
            end
        end
    end

    private

    def self.resolve_game(game)
        game_wagers = Wager.where(temperature_bet_id: game.id)
        actual_temps = HistoricWeather.get_temps(game.location, game.date)
        puts "DAILY HIGH RESOLVING:"
        resolve_options(game_wagers.where(bet_type: 1), game_wagers.where(bet_type: 2), game.over_high_points, game.under_high_points, game.high, actual_temps.max)
        puts "DAILY LOW RESOLVING:"
        resolve_options(game_wagers.where(bet_type: 3), game_wagers.where(bet_type: 4), game.over_low_points, game.under_low_points, game.low, actual_temps.min)
        game.destroy
    end

    def self.resolve_options(over_wagers, under_wagers, over_points, under_points, bet_temp, compare_temp)
        curr_over_points = over_points
        curr_under_points = under_points
        total_points_bet = over_points + under_points
        if compare_temp > bet_temp
            over_wagers.each do |wager|
                percent = wager.amount.to_f / over_points
                points_won = percent * under_points
                wager_owner = User.find(wager.user_id)
                wager_owner.points += (wager.amount + points_won.floor)
                wager_owner.save
                # for debugging purposes
                curr_over_points -= wager.amount
                curr_under_points -= points_won.floor
                puts "wager amount: #{wager.amount}, percent: #{percent}, points_won: #{points_won}, remaining: #{curr_over_points} || #{curr_under_points}"
            end
        elsif compare_temp < bet_temp
            under_wagers.each do |wager|
                percent = wager.amount.to_f / under_points
                points_won = percent * over_points
                wager_owner = User.find(wager.user_id)
                wager_owner.points += (wager.amount + points_won.floor)
                wager_owner.save
                # for debugging purposes
                curr_under_points -= wager.amount
                curr_over_points -= points_won.floor
                puts "wager amount: #{wager.amount}, percent: #{percent}, points_won: #{points_won}, remaining: #{curr_over_points} || #{curr_under_points}"
            end
        end
    end
end
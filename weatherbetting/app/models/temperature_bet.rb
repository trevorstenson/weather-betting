class TemperatureBet < ApplicationRecord
    def apply_wager(amount, bet_type)
        case bet_type
        when 1
            self.over_high_points += amount
        when 2
            self.under_high_points += amount
        when 3
            self.over_low_points += amount
        when 4
            self.under_low_points += amount
        end
    end
end

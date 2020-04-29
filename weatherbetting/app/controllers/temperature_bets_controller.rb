class TemperatureBetsController < ApplicationController
    def index
        @bets = TemperatureBet.all.to_json
        render :json => {
            bets: @bets
        }
    end
end

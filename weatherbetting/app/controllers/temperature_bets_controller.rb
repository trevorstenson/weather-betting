class TemperatureBetsController < ApplicationController
    before_action :authorize_request, except: :index

    def index
        @bets = TemperatureBet.all.to_json
        render :json => {
            bets: @bets
        }
    end

    def submit
        @bets = params[:formattedBets]
        points_required = @bets.map { |b| b[:betAmount].to_i }.inject(0, &:+)
        if points_required <= @current_user.points
            @bets.each do |old_bet|
                bet = TemperatureBet.find(old_bet[:id])
                if bet.present?
                    wager = @current_user.wagers.new(amount: old_bet[:betAmount], bet_type: old_bet[:type], time_placed: Time.now, temperature_bet_id: bet.id)
                    if wager.save
                        bet.apply_wager(old_bet[:betAmount].to_i, old_bet[:type].to_i)
                        bet.save
                        @current_user.points -= old_bet[:betAmount].to_i
                        @current_user.save
                    else
                        raise "Error Saving"
                    end
                else
                    raise "Invalid Bet"
                end
            end
        else
            render json: { errors: 'Not enough points' }, status: :unprocessable_entity
        end
        render json: { points: @current_user.points }, status: :ok
    end
end

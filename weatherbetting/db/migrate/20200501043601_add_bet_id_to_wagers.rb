class AddBetIdToWagers < ActiveRecord::Migration[6.0]
  def change
    add_column :wagers, :temperature_bet_id, :integer
  end
end

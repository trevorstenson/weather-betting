class AddColumnsToTemperatureBet < ActiveRecord::Migration[6.0]
  def change
    add_column :temperature_bets, :over_low_points, :integer
    add_column :temperature_bets, :under_low_points, :integer
  end
end

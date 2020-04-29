class ChangeTemperatureBetsColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :temperature_bets, :over_points, :over_high_points
    rename_column :temperature_bets, :under_points, :under_high_points
  end
end

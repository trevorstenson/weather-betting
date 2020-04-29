class CreateTemperatureBets < ActiveRecord::Migration[6.0]
  def change
    create_table :temperature_bets do |t|
      t.string :location
      t.date :date
      t.integer :high
      t.integer :low
      t.integer :over_points
      t.integer :under_points

      t.timestamps
    end
  end
end

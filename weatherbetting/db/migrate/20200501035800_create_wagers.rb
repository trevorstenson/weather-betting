class CreateWagers < ActiveRecord::Migration[6.0]
  def change
    create_table :wagers do |t|
      t.integer :amount
      t.datetime :time_placed
      t.integer :bet_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

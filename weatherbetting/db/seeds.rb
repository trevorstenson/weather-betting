# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', username: 'admin', email: 'stenson124@gmail.com', points: 1000)

TemperatureBet.create(location: 'Boston, MA', date: Date.strptime('04-30-2020', '%m-%d-%Y'), high: 54, low: 37, over_high_points: 700, under_high_points: 300, over_low_points: 21, under_low_points: 34)
TemperatureBet.create(location: 'Portland, OR', date: Date.strptime('05-01-2020', '%m-%d-%Y'), high: 60, low: 52, over_high_points: 0, under_high_points: 0, over_low_points: 0, under_low_points: 0)

user = User.first
user.wagers.create(amount: 43, time_placed: Time.now, bet_type: 2, temperature_bet_id: TemperatureBet.first.id)
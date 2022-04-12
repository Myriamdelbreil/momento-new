# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pcoppy = User.create(email: "pcoppy@gmail.com", password: "pcoppy", username: "pcoppy")
loulou = User.create(email: "loulou@gmail.com", password: "loulou", username: "loulou")
tomtom = User.create(email: "tomtom@gmail.com", password: "tomtom", username: "tomtom")
mymy = User.create(email: "mymy@gmail.com", password: "mymymy", username: "mymy")

puts "Users créés"

User.all.each do |user|
  username = user.email.split('@').first
  trip = Trip.new(user: user, start_date: "2022/04/09", end_date:" 2022/04/30", title:"voyage de #{username.capitalize}", description: "Départ à Bali, Barcelone, Madrid, Pékin très prochain !!!", city:"Peu importe")
  trip.save
end

puts '4 voyages créés'

Trip.all.each do |trip|
  participant = Participant.new(trip: trip, user: trip.user)
  participant.save
end

puts "1er participant de chaque voyage créé"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  subject = Faker::Lorem.sentence(40)
  users.each { |user| user.microposts.create!(content: content, subject: subject) }
end


user1 = User.create!(name:"Andreas Yinnakou", email:"yiannakou_andreas@hotmail.com", password:"andreas", activated: true)
user2 = User.create!(name:"Vaggelis Giataganas", email:"vaggelis@email.com", password:"vaggelis", activated: true)

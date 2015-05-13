# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "**  Seeding Database: seeding ***\n\n"

unless User.where(email: "user@hostname.com").first
User.create!(email: 'user@hostname.com',
            password: 'user1234',
            password_confirmation: 'user1234')
puts "-- Created user@hostname.com with password user1234\n"
end

unless Fabric.where(serial: 'RMC20150409').first
  Fabric.create!({color: 'Red', serial: 'RMC20150409', price: 7.5, quantity: 10})
end

unless Fabric.where(serial: 'GMC20150309').first
  Fabric.create!({color: 'Green', serial: 'GMC20150309', price: 8.0, quantity: 25})
end
puts "-- Created fabrics\n"

puts "\n**  Seeding Database: completed ***"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create({email: 'user@hostname.com', password: 'user1234'})
fabric = Fabric.create({color: 'Red', serial: 'RMC20150409', price: 7.5, quantity: 10})
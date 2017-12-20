# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
rest = Restaurant.create(name: "Luigi's")
(0..6).each {|i| rest.schedules.create(time_open: "18:00", time_close: "01:00", weekday: i)}
rest.tables.create(name: "Corner 1")
rest.tables.create(name: "Main")
rest.tables.create(name: "Corner 2")
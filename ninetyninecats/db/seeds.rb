# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat1 = Cat.create(name: 'Bob', birth_date: DateTime.new(2008, 6, 22), color:'Brown', sex:'M', description:'Just a cat')

cat2 = Cat.create(name: 'Bloob', birth_date: DateTime.new(2009, 3, 22), color:'White', sex:'M', description:'Just a cat')
cat3 = Cat.create(name: 'Barb', birth_date: DateTime.new(2015, 6, 22), color:'Yellow', sex:'F', description:'Just a cat')


request1 = CatRentalRequest.create!(cat_id: 1, start_date: DateTime.new(2016, 12, 1), end_date: DateTime.new(2016, 12, 5))
request2 = CatRentalRequest.create!(cat_id: 2, start_date: DateTime.new(2016, 11, 5), end_date: DateTime.new(2016, 12, 1))

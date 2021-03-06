# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  Question.create(title:Faker::Company.bs,content:Faker::Lorem.sentence(3))
end

30.times do
  Answer.create(content:Faker::Lorem.sentence(3),question_id:rand(1..10))  
end

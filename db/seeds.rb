# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['Test Category #1', 'Test Category #2', 'Test Category #3'].each do |category|
  Category.create!(title: category)
end

['Test #1', 'Test #2', 'Test #3', 'Test #4', 'Test #5'].each do |test|
  Test.create!(title: test, category_id: 1)
end

(0..15).each do |num|
  Question.create!(content: num)
  Answer.create!(content: num)
end

User.create!(username: 'test', password: '123')
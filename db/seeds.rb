# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: 'Test Category #1' },
  { title: 'Test Category #2' },
  { title: 'Test Category #3' }
])

tests = Test.create!([
  { title: 'Test #1', category_id: categories.sample.id },
  { title: 'Test #2', category_id: categories.sample.id },
  { title: 'Test #3', category_id: categories.sample.id }
])

(0..15).each do |num|
  Question.create!(content: num)
  Answer.create!(content: num)
end

User.create!(username: 'test', password: '123')
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(username: 'test', password: '123')

categories = Category.create!([
  { title: 'Test Category #1' },
  { title: 'Test Category #2' },
  { title: 'Test Category #3' }
])

tests = Test.create!([
  { title: 'Test #1', category: categories.sample, author: user },
  { title: 'Test #2', category: categories.sample, author: user },
  { title: 'Test #3', category: categories.sample, author: user }
])

questions = Question.create!([
  { content: 'Question #1', test: tests.sample },
  { content: 'Question #2', test: tests.sample },
  { content: 'Question #3', test: tests.sample },
  { content: 'Question #4', test: tests.sample }
])
  
answers = Answer.create!([
  { content: 'Answer #1', question: questions.sample },
  { content: 'Answer #2', question: questions.sample },
  { content: 'Answer #3', question: questions.sample },
  { content: 'Answer #4', question: questions.sample }
])

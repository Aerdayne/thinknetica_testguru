user = User.create!(username: 'test', password: '123')

categories = Category.create!([
  { title: 'Test Category #1' },
  { title: 'Test Category #2' },
  { title: 'Test Category #3' }
])

categories.each do |category|
  Test.create!([
    { title: "Test A#{category.id}", category: category, author: user, level: rand(0..6) },
    { title: "Test B#{category.id}", category: category, author: user, level: rand(0..6) },
    { title: "Test C#{category.id}", category: category, author: user, level: rand(0..6) }
  ])
end

tests = Test.all

tests.each do |test_model|
  4.times do |num|
    question = Question.new({ content: "Question #{num}", test: test_model })
    4.times do |num|
      question.answers.build({ content: "Answer #{num}", question: question, correct: [true, false].sample })
    end
    question.save
  end
end
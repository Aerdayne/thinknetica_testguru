user = User.create!(name: 'test', password: '123456', email: 'asd@asd.com', type: 'Admin', username: 'InternetJanitor')

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
      question.answers.build({ content: "Answer #{num}", question: question, correct: false }) #[true, false].sample })
    end
    question.save
  end
end

Badge.create!([
  { name: 'Category #1 Guru', 
    description: "Complete all tests from the 'Test Category #1' category", 
    image_path: 'all_category_1_tests.svg',
    criterion: 'category',
    value: 'Test Category #1' },
  { name: 'No second chance', 
    description: "Complete a test at the first try", 
    image_path: 'first_try.svg',
    criterion: 'first attempt'},
  { name: 'Test Guru',
    description: "Complete all the hard tests (level 5 or higher)", 
    image_path: 'all_hard_tests.svg',
    criterion: 'level',
    value: 'hard' }
])
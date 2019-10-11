class User < ApplicationRecord
  has_many :taken_tests, dependent: :destroy
  has_many :tests, through: :taken_tests
  has_many :tests, class_name:'Test', foreign_key:'author_id'
 
  def tests_taken(level = 0)
    Test.joins("INNER JOIN taken_tests ON taken_tests.test_id = tests.id")
        .where(taken_tests: { user_id: id }, tests: { level: level })
  end
end

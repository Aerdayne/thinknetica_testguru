class User < ApplicationRecord
  has_many :taken_tests, dependent: :destroy
  has_many :tests, through: :taken_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
 
  def tests_taken(level = 0)
    tests.where(level: level)
  end
end

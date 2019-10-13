class User < ApplicationRecord
  has_many :taken_tests, dependent: :destroy
  has_many :tests, through: :taken_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
 
  validates :email, presence: true

  def tests_taken(level = :easy)
    tests.difficulty(level)
  end
end

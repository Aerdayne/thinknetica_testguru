class User < ApplicationRecord
  has_many :taken_tests, dependent: :destroy
  has_many :tests, through: :taken_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
 
  validates :username, :email, presence: true

  def taken_tests_by_level(level = :easy)
    tests.send(level)
  end
end

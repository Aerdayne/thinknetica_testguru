class User < ApplicationRecord
  has_many :taken_tests, dependent: :destroy
  has_many :tests, through: :taken_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_secure_password

  def taken_test(test)
    taken_tests.order(id: :desc).find_by(test: test)
  end

  def taken_tests_by_level(level)
    tests.where(level: level)
  end
end

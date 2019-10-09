class User < ApplicationRecord
  has_many :taken_tests, dependent: :destroy
  has_many :tests, through: :taken_tests

  def tests_taken(level = 0)
    tests.where(tests: { level: level })
  end
end

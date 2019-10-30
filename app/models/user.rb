class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :taken_tests, dependent: :destroy
  has_many :tests, through: :taken_tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, uniqueness: true
  validates :name, presence: true

  def taken_test(test)
    taken_tests.order(id: :desc).find_by(test: test)
  end

  def taken_tests_by_level(level)
    tests.where(level: level)
  end
end

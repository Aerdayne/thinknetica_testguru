class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :taken_tests, dependent: :destroy
  # Probably not the best solution
  has_many :tests, through: :taken_tests do
    def successful
      where("taken_tests.successful = ?", true)
    end
  end

  has_many :given_badges, dependent: :destroy
  has_many :badges, through: :given_badges

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  has_many :gists, dependent: :destroy

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    is_a?(Admin)
  end

  def taken_test(test)
    taken_tests.order(id: :desc).find_by(test: test)
  end

  def taken_tests_by_level(level)
    tests.where(level: level)
  end
end

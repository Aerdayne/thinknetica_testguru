class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'

  has_many :taken_tests, dependent: :destroy
  has_many :users, through: :taken_tests

  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :difficulty, -> (difficulty) do
    case difficulty
    when :easy
      where(level: 0..1)
    when :medium
      where(level: 2..4)
    when :hard
      where(level: 5..Float::INFINITY)
    else
      where(level: 0..Float::INFINITY)
    end
  end

  class << self
    def titles_list(cat_title = 'default')
      Test.joins(:category).where(categories: {title: cat_title}).order(title: :desc).pluck(:title)
    end
  end
end

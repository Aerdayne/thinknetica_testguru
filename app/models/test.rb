class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'

  has_many :taken_tests, dependent: :destroy
  has_many :users, through: :taken_tests

  has_many :questions, dependent: :destroy

  before_save :before_save_convert_duration

  validates :title, :content, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def difficulty
    if level.between?(0, 1)
      'easy'
    elsif level.between?(2, 4)
      'medium'
    elsif level.between?(5, Float::INFINITY)
      'hard'
    end
  end

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY)}
  scope :by_category, ->(cat_title) { joins(:category).where(categories: {title: cat_title}).order(title: :desc)}

  private

  def before_save_convert_duration
    self.duration = duration * 60 unless duration.nil?
  end
end
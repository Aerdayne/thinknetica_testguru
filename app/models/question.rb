class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :content, presence: true
  validates_length_of :answers, minimum: 1, maximum: 4
end

class Answer < ApplicationRecord
  belongs_to :question

  validates :content, presence: true
  validate :question_limit

  scope :correct, -> { where(correct: true) }

  private

  def question_limit
    return unless question.answers.count.between?(1..4)

    errors.add(:question_id, 'Question should have from 1 to 4 answers')
  end
end
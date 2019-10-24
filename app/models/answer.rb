class Answer < ApplicationRecord
  belongs_to :question

  validates :content, presence: true
  validate :question_limit

  scope :correct, -> { where(correct: true) }

  private

  def question_limit
    return unless question.answers.count >= 4 && new_record?

    errors.add(:question_id, 'Question should have at least 1 answer and 4 at most')
  end
end
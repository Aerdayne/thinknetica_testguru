class TakenTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    p answer_ids.reject(&:empty?)
    self.correct_questions += 1 if correct_answer?(answer_ids.reject(&:empty?))
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    correct_questions / test.questions.size >= 0.85
  end

  def output_progress
    "#{test.questions.index(current_question) + 1}/#{test.questions.length}"
  end

  def output_result
    "Your result: #{correct_questions}/#{test.questions.size}"
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end

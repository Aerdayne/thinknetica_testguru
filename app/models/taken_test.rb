class TakenTest < ApplicationRecord
  MINIMUM_PERCENTAGE = 0.85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids.reject(&:empty?)) && in_time?
    self.timed = in_time?
    self.successful = successful?
    save!
    self.current_question = nil unless in_time?
  end

  def completed?
    current_question.nil?
  end

  def in_time?
    return true if test.duration.nil?

    end_time > DateTime.now
  end

  def end_time
    return if test.duration.nil?

    created_at.to_datetime + test.duration.seconds
  end

  def time_left
    return if test.duration.nil?

    (end_time.to_f - DateTime.now.to_f).to_f
  end

  def successful?
    correct_questions / test.questions.size >= MINIMUM_PERCENTAGE
  end

  def questions_amount
    test.questions.length
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
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

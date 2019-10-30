module AnswersHelper
  def answer_header(answer)
    action = answer.new_record? ? 'Create new' : 'Edit'
    "#{action} test '#{answer.question.test.title}' question '#{answer.question.id}' answer"
  end
end

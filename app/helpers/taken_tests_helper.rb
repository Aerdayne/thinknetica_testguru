module TakenTestsHelper
  def result_prompt(taken_test)
    color = if taken_test.successful?
              'text-success'
            else
              'text-danger'
            end
    content_tag(:h3, output_result(taken_test), class: color)
  end

  def output_result(taken_test)
    "Your result: #{taken_test.correct_questions}/#{taken_test.questions_amount}"
  end

  def output_progress(taken_test)
    "#{taken_test.current_question_number}/#{taken_test.questions_amount}"
  end

end

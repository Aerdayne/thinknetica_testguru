module TakenTestsHelper
  def result_prompt(taken_test)
    correct_questions = taken_test.correct_questions 
    total_questions = taken_test.test.questions.size
    color = if (correct_questions / total_questions) >= 0.85
              'text-success'
            else
              'text-danger'
            end
    content_tag(:h3, "Your result: #{correct_questions}/#{total_questions}", class: color)
  end
end

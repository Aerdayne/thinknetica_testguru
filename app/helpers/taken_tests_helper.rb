module TakenTestsHelper
  def result_prompt(taken_test)
    color = if taken_test.successful?
              'text-success'
            else
              'text-danger'
            end
    content_tag(:h3, taken_test.output_result, class: color)
  end
end

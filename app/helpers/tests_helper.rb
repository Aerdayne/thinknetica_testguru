module TestsHelper
  def test_header(test)
    action = test.new_record? ? 'Create new' : 'Edit'
    "#{action} Test"
  end

  def start_button(test)
    button_to 'Start', start_test_path(test), class: 'btn btn-primary' if test.questions.any?
  end
end

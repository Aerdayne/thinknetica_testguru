module TestsHelper
  def test_header(test)
    action = test.new_record? ? 'Create new' : 'Edit'
    "#{action} Test"
  end
end

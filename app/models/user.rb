class User < ApplicationRecord
  def tests_taken(level = 0)
    Test.joins("INNER JOIN taken_tests ON taken_tests.test_id = tests.id")
        .where(taken_tests: { user_id: id }, tests: { level: level })
  end
end

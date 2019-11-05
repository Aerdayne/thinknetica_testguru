class BadgeDispenserService
  def initialize(test)
    badges = []
  end

  def badge_all_tests_of_category_1(test)
    return unless test.category.name == 'Test Category #1' && !test.user.badges.find_by(name: 'Test Category #1 completed')

    Badge.find_by(name: 'Test Category #1 completed') if 
      (Test.by_category('Test Category #1') - test.user.tests.by_category('Test Category #1')).empty?
  end

  def badge_first_try(test)
    return unless test.user.tests.
  end
end
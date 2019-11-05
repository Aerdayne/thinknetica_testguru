class BadgeDispenserService
  def initialize
    @badges = []
    @criteria = [method(:badge_all_category_1_tests),
                method(:badge_first_try),
                method(:badge_all_hard_tests)]
  end

  def parse_criteria(taken_test)
    @criteria.each do |method|
      @badges << method.call(taken_test)
    end
    @badges
  end

  private

  def badge_all_category_1_tests(taken_test)
    return unless taken_test.test.category.title == 'Test Category #1' && !taken_test.user.badges.find_by(name: 'Category #1 Guru')

    Badge.find_by(name: 'Category #1 Guru') if
      (Test.by_category('Test Category #1') - taken_test.user.tests.successful.by_category('Test Category #1')).empty?
  end

  def badge_first_try(taken_test)
    return unless taken_test.user.tests.where(id: taken_test.test.id).one?

    Badge.find_by(name: 'No second chance')
  end

  def badge_all_hard_tests(taken_test)
    return unless taken_test.test.level >= 5 && !taken_test.user.badges.find_by(name: 'Test Guru')

    Badge.find_by(name: 'Test Guru') if
      (Test.hard - taken_test.user.tests.successful.hard).empty?
  end
end
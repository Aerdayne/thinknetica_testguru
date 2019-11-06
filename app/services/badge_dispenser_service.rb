class BadgeDispenserService
  def initialize; end

  def parse_criteria(taken_test)
    Badge.select { |badge| send(badge.criterion.to_sym, badge, taken_test) }
  end

  def category(badge, taken_test)
    return unless badge.value == taken_test.test.category.title && !taken_test.user.badges.include?(badge)

    badge if (Test.by_category(taken_test.test.category.title) - taken_test.user.tests.successful.by_category(taken_test.test.category.title)).empty?
  end

  def first_attempt(badge, taken_test)
    return unless taken_test.user.tests.where(id: taken_test.test.id).one?

    badge
  end

  def level(badge, taken_test)
    return unless badge.value == taken_test.test.difficulty && !taken_test.user.badges.include?(badge)

    scope_name = taken_test.test.difficulty.to_sym
    badge if (Test.hard - taken_test.user.tests.successful.method(scope_name).call).empty?
  end
end
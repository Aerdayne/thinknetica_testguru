class BadgeDispenserService
  def initialize
    @badges = []
    @criteria = [method(:badges_category),
                method(:badge_first_try),
                method(:badges_level)]
  end

  def parse_criteria(taken_test)
    @criteria.map { |method| @badges << method.call(taken_test) }
    @badges
  end

  private

  def badges_category(taken_test)
    badge_record = Badge.find_by(criterion: 'category', value: taken_test.test.category.title)
    #return unless Badge.find_by(criterion: 'category', value: taken_test.test.category.title) && !taken_test.user.badges.find_by(criterion: 'category', value: taken_test.test.category.title)
    return unless badge_record && !taken_test.user.badges.include?(badge_record)

    badge_record if (Test.by_category(taken_test.test.category.title) - taken_test.user.tests.successful.by_category(taken_test.test.category.title)).empty?
  end

  def badge_first_try(taken_test)
    return unless taken_test.user.tests.where(id: taken_test.test.id).one?

    Badge.find_by(criterion: 'first attempt')
  end

  def badges_level(taken_test)
    badge_record = Badge.find_by(criterion: 'level', value: taken_test.test.difficulty )
    #return unless taken_test.test.level >= 5 && !taken_test.user.badges.find_by(name: 'Test Guru')
    return unless badge_record && !taken_test.user.badges.include?(badge_record)

    scope_name = taken_test.test.difficulty.to_sym
    badge_record if (Test.hard - taken_test.user.tests.successful.method(scope_name).call).empty?
  end
end
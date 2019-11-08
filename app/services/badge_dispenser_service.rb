class BadgeDispenserService
  def initialize(taken_test)
    @taken_test = taken_test
    @user = @taken_test.user
  end

  def parse_criteria
    Badge.select { |badge| send(badge.criterion.to_sym, badge) }
  end

  def category(badge)
    return unless @taken_test.successful? && badge.value == @taken_test.test.category.title

    (Test.by_category(@taken_test.test.category.title) -
        @user.tests.successful.since_date(last_given_badge_date(badge)).by_category(@taken_test.test.category.title)).empty?
  end

  def first_attempt(_badge)
    @taken_test.successful? && @user.tests.where(id: @taken_test.test.id).one?
  end

  def level(badge)
    return unless @taken_test.successful? && badge.value == @taken_test.test.difficulty

    scope_name = @taken_test.test.difficulty.to_sym
    (Test.send(badge.value) - @user.tests.successful.since_date(last_given_badge_date(badge)).method(scope_name).call).empty?
  end

  private

  def last_given_badge_date(badge)
    @user.given_badges.find_by(badge_id: badge.id)&.created_at
  end
end
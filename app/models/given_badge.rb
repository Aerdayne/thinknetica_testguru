class GivenBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user

  def amount
    GivenBadge.joins(:badge).where(badges: { name: badge.name }).count
  end
end

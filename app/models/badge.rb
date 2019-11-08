class Badge < ApplicationRecord
  AVAILABLE_CRITERIA = %w[category level first_attempt].freeze

  has_many :given_badges, dependent: :destroy
  has_many :users, through: :given_badges

  validates :name, :image_path, presence: true
  validates :criterion, uniqueness: { scope: :value }
  validates :criterion, inclusion: { in: AVAILABLE_CRITERIA }

  def internationalized_criterion
    I18n.t(".badges.#{criterion}")
  end
end

class Badge < ApplicationRecord
  has_many :given_badges, dependent: :destroy
  has_many :users, through: :given_badges

  AVAILABLE_CRITERIA = %w[category level].freeze

  validates :name, :image_path, presence: true
  validates :criterion, uniqueness: { scope: :value }
  validates :criterion, inclusion: { in: AVAILABLE_CRITERIA }
end

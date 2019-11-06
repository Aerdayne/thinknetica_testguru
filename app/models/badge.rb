class Badge < ApplicationRecord
  has_many :given_badges, dependent: :destroy
  has_many :users, through: :given_badges

  validates :name, :image_path, presence: true
  validates :criterion, uniqueness: { scope: :value }
end

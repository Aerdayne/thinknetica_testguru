class Badge < ApplicationRecord
  has_many :given_badges, dependent: :destroy
  has_many :users, through: :given_badges
end

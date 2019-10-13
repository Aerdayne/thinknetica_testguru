class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  validates :content, presence: true

  default_scope -> { order(title: :asc) }
end

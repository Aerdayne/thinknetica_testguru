class Test < ApplicationRecord
  belongs_to :category

  has_many :taken_tests, dependent: :destroy
  has_many :users, through: :taken_tests

  class << self
    def titles_list(cat_title = 'default')
      joins(:category).where(categories: { title: cat_title }).order(id: :desc).pluck(:title)
    end
  end

end

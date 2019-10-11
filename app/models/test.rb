class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true

  has_many :questions
  has_many :taken_tests, dependent: :destroy
  has_many :users, through: :taken_tests

  class << self
    def titles_list(cat_title = 'default')
      joins(:category).where(categories: { title: cat_title }).order(id: :desc).pluck(:title)
    end
  end

end

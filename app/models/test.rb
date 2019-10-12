class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User'

  has_many :taken_tests, dependent: :destroy
  has_many :users, through: :taken_tests

  has_many :questions, dependent: :destroy

  class << self
    def titles_list(cat_title = 'default')
      Test.joins(:category).where(categories: {title: cat_title}).order(title: :desc).pluck(:title)
    end
  end

end

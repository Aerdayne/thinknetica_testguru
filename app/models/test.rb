class Test < ApplicationRecord

  class << self
    def titles_list(cat_title = 'default')
      Test.joins("INNER JOIN categories ON tests.category_id = categories.id")
          .where(categories: { title: cat_title }).order(title: :desc).pluck(:title)
    end
  end

end

class AddCategoryTitle < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :title, :text
    change_column_default :categories, :title, from: nil, to: 'no title'
    change_column_null :categories, :title, false
  end
end

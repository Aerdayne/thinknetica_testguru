class BasicIntegrityFix < ActiveRecord::Migration[6.0]
  def change
    change_column_default :answers, :correct, from: nil, to: false
    change_column_default :answers, :content, from: nil, to: 'no content'
    change_column_null :answers, :content, false
    change_column_null :answers, :correct, false

    change_column_default :questions, :content, from: nil, to: 'no content'
    change_column_null :questions, :content, false

    change_column_default :categories, :content, from: nil, to: 'no content'
    change_column_null :categories, :content, false

    change_column_default :tests, :content, from: nil, to: 'no content'
    change_column_null :tests, :content, false

    change_column_default :tests, :title, from: nil, to: 'no title'
    change_column_default :tests, :level, from: nil, to: 1
    change_column_null :tests, :title, false
    change_column_null :tests, :level, false

    change_column_null :users, :name, false
    change_column_null :users, :email, false
  end
end

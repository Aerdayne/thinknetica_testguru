class BasicIntegrity < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :content, false
    change_column_null :answers, :correct, false
    change_column_default :answers, :correct, false

    change_column_null :questions, :content, false

    change_column_null :categories, :content, false

    change_column_null :tests, :title, false
    change_column_null :tests, :level, false
    change_column_default :tests, :level, 1

    change_column_null :users, :username, false
    change_column_null :users, :password, false
  end
end

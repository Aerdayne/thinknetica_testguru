class AddTestUserRelation < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }
    add_reference :tests, :category, foreign_key: true
    change_column_default :taken_tests, :successful, from: nil, to: false
    change_column_null :taken_tests, :successful, false
  end
end

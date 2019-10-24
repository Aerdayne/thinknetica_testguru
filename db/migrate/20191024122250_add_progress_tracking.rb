class AddProgressTracking < ActiveRecord::Migration[6.0]
  def change
    add_reference :taken_tests, :current_question, foreign_key: { to_table: :questions }
    add_column :taken_tests, :correct_questions, :integer, default: 0
  end
end

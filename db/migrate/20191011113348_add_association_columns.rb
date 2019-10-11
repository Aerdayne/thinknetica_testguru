class AddAssociationColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :question_id, :integer
    add_column :questions, :test_id, :integer
  end
end

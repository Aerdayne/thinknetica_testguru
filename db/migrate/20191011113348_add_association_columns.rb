class AddAssociationColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :question
    add_reference :questions, :test
  end
end

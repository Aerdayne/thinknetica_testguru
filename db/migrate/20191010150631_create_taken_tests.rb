class CreateTakenTests < ActiveRecord::Migration[6.0]
  def change
    create_table :taken_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :successful
      t.boolean :timed

      t.timestamps
    end
  end
end

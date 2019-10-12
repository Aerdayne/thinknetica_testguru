class CreateTakenTests < ActiveRecord::Migration[6.0]
  def change
    create_table :taken_tests do |t|
      t.references :user
      t.references :test

      t.timestamps
    end
  end
end

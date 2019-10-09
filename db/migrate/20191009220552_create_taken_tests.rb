class CreateTakenTests < ActiveRecord::Migration[6.0]
  def change
    create_table :taken_tests do |t|
      t.belongs_to :user
      t.belongs_to :test

      t.timestamps
    end
  end
end

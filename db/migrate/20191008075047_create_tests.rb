class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.text :title
      t.text :content
      t.integer :level
      t.integer :duration

      t.timestamps
    end
  end
end

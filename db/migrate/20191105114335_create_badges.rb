class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.text :name
      t.text :description
      t.text :image_path

      t.timestamps
    end
  end
end

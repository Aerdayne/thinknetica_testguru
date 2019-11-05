class AddConstraintsToBadges < ActiveRecord::Migration[6.0]
  def change
    change_column_null :badges, :name, false
    change_column_null :badges, :image_path, false
    add_index :badges, :name
  end
end

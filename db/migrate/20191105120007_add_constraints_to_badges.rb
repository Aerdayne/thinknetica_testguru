class AddConstraintsToBadges < ActiveRecord::Migration[6.0]
  def change
    change_column_null :badges, :name, false
    change_column_null :badges, :image_path, false
    change_column_default :badges, :description, 'No description'
    add_index :badges, :name
  end
end

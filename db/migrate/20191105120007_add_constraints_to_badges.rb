class AddConstraintsToBadges < ActiveRecord::Migration[6.0]
  def change
    change_column_null :badges, :name, false
    change_column_null :badges, :image_path, false
    change_column_default :badges, :description, 'No description'
    change_column_default :badges, :criterion, 'unspecified'
    change_column_default :badges, :value, 'unspecified'
    add_index :badges, :name
    add_index :badges, %i[criterion value], unique: true
  end
end

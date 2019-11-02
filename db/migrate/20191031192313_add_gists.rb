class AddGists < ActiveRecord::Migration[6.0]
  def change
    add_reference :gists, :user, foreign_key: true
    add_reference :gists, :question, foreign_key: true
    change_column_null :gists, :url, false
  end
end

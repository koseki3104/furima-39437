class ChangeUserToReferenceInItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :user
    add_reference :items, :user, null: false, foreign_key: true
  end
end
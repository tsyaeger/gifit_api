class AddIndexToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_index :relationships, :user_id
    add_index :relationships, :contact_id
  end
end

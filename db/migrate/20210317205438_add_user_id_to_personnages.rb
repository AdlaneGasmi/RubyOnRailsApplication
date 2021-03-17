class AddUserIdToPersonnages < ActiveRecord::Migration[6.1]
  def change
    add_column :personnages, :user_id, :integer
    add_index :personnages, :user_id
  end
end

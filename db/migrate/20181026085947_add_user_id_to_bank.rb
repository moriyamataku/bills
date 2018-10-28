class AddUserIdToBank < ActiveRecord::Migration[5.1]
  def change
    add_column :banks, :user_id, :integer, after: :id
  end
end

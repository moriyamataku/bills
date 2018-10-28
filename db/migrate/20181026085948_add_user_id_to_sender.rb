class AddUserIdToSender < ActiveRecord::Migration[5.1]
  def change
    add_column :senders, :user_id, :integer, after: :id
  end
end

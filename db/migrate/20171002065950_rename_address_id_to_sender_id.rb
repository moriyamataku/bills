class RenameAddressIdToSenderId < ActiveRecord::Migration[5.1]
  def change
    rename_column :invoices, :address_id, :sender_id
  end
end

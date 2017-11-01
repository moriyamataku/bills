class AddAddressBankToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :address_id, :integer
    add_column :invoices, :bank_id, :integer
  end
end

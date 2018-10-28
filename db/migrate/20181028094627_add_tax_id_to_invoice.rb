class AddTaxIdToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :tax_id, :integer
  end
end

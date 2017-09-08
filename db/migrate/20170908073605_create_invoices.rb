class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :serial_number
      t.string :recipient
      t.string :title
      t.integer :total_amount
      t.date :billing_date

      t.timestamps
    end
  end
end

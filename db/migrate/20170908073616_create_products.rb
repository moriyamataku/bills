class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :invoice_id
      t.string :name
      t.integer :number
      t.string :unit
      t.integer :unit_price
      t.integer :amount

      t.timestamps
    end
    add_index :products, :invoice_id
  end
end

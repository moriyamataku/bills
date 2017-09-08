class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :number
      t.string :unit
      t.integer :unit_price
      t.integer :amount

      t.timestamps
    end
  end
end

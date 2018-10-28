class CreateTaxes < ActiveRecord::Migration[5.1]
  def change
    create_table :taxes do |t|
      t.decimal :rate, precision: 9, scale: 3

      t.timestamps
    end
  end
end

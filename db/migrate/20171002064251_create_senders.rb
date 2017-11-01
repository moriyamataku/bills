class CreateSenders < ActiveRecord::Migration[5.1]
  def change
    create_table :senders do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :postal_code
      t.string :address1
      t.string :address2
      t.string :address3

      t.timestamps
    end
  end
end

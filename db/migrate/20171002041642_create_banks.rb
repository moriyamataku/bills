class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :bank_name
      t.string :branch_name
      t.string :account_type
      t.string :account_number
      t.string :account_holder

      t.timestamps
    end
  end
end

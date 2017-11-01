class ChangeDatatypeNumberOfProduct < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :number, :decimal, :precision => 9, :scale => 3
  end
end

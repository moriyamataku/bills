class Product < ApplicationRecord
  belongs_to :invoice
  before_save :calc_amount_price

  validates :number, presence: true
  validates :unit_price, presence: true

  def calc_amount_price
    amount = number * unit_price
  end
end

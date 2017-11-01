class Invoice < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products,
                                allow_destroy: true,
                                reject_if: :reject_product
  belongs_to :sender
  belongs_to :bank

  def total_amount_without_tax
    products.inject(0) { |sum, product| sum + product.amount }
  end

  private

  def reject_product(attributed)
    attributed['name'].blank?
  end
end

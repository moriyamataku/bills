class Invoice < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products,
                                allow_destroy: true,
                                reject_if: :reject_product
  belongs_to :sender
  belongs_to :bank
  belongs_to :user

  def total_amount_without_tax
    products.inject(0) { |sum, product| sum + (product.try(:amount) || 0) }
  end

  def self.dup_invoice(origin_invoice)
    invoice = origin_invoice.dup
    invoice.products << origin_invoice.products.map(&:dup)
    invoice
  end

  private

  def reject_product(attributed)
    attributed['name'].blank?
  end
end

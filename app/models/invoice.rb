class Invoice < ApplicationRecord
  has_many :products
  accepts_nested_attributes_for :products,
                                allow_destroy: true,
                                reject_if: :reject_product
  belongs_to :sender
  belongs_to :bank
  belongs_to :user
  belongs_to :tax
  after_initialize :set_initial_serial_number, if: :new_record?

  def total_amount_without_tax
    products.inject(0) { |sum, product| sum + (product.try(:amount) || 0) }
  end

  def tax_rate
    rate = tax.try(:rate)
    rate ? (rate / 100) : 0
  end

  def tax_display
    rate = tax.try(:rate) || 0
    rate.to_i == rate ? rate.to_i : rate
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

  def set_initial_serial_number
    self.serial_number = "#{Date.current.strftime('%Y%m%d')}_001"
  end
end

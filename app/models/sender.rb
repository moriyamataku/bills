class Sender < ApplicationRecord
  def full_address
    "〒#{postal_code} #{address1} #{address2} #{address3}" 
  end
end

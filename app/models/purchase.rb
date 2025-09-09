class Purchase < ApplicationRecord
  validates :code, :subtotal_amount, :total_amount, :tax_amount, :status
  belongs_to :customer
end

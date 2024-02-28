class Warehouse < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user

  validates :name , presence:true
end

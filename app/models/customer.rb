class Customer < ApplicationRecord
  has_many :purchases
  has many :sales
end

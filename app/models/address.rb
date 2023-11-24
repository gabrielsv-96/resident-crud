class Address < ApplicationRecord
  belongs_to :resident
  
  validates :postal_code, :public_address, :city, :state_code, presence: true
end
class Resident < ApplicationRecord
  has_one :address
  has_one_attached :picture
  accepts_nested_attributes_for :address
end
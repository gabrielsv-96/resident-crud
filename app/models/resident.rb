class Resident < ApplicationRecord
  include CnsHelper

  has_one :address
  has_one_attached :picture
  accepts_nested_attributes_for :address

  validates :full_name, :cpf, :email, :birth_date, :phone, presence: true
  validate :valid_cpf?, :valid_cns?, :valid_date?

  def valid_cpf?
    errors.add(:cpf, 'inválido') unless CPF.valid?(cpf)
  end

  def valid_cns?
    if cns.present?
      errors.add(:cns, 'inválido') unless CnsHelper.validate(cns) 
    end
  end

  def valid_date?
    unless birth_date.blank?
      errors.add(:birth_date, 'invalida') if birth_date > Date.today
    end
  end

  def self.search(search_term)
    if search_term
      self.joins(:address).where(
        "full_name ILIKE :search OR
         district ILIKE :search OR
         city ILIKE :search OR
         phone::text LIKE :search",
         search: "%#{search_term}%"
      )
    else
      self.all
    end
  end
end
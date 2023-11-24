require 'rails_helper'

RSpec.describe Address, type: :model do
  subject do
    described_class.new(
      postal_code: '75709330',
      public_address: 'Rua 4',
      district: 'Loteamento JK',
      city: 'Catalão',
      state_code: 'GO',
      resident: Resident.new
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a resident' do
    subject.resident = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a postal code' do
    subject.postal_code = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a public address' do
    subject.public_address = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a city' do
    subject.city = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a state code' do
    subject.state_code = nil
    expect(subject).to_not be_valid
  end
end
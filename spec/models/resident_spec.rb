require 'rails_helper'

RSpec.describe Resident, type: :model do
  subject do
    described_class.new(
      full_name: 'Nome teste',
      cpf: '60755290046', 
      cns: '915907452330002',
      email: 'email@test.com',
      phone: '11999999999',
      birth_date: Date.today - 30.years
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a full_name' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a cpf' do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a phone' do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid cpf' do
    subject.cpf = '2'
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid cns' do
    subject.cns = '2'
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid birth_date' do
    subject.birth_date = DateTime.now + 1.years
    expect(subject).to_not be_valid
  end
end
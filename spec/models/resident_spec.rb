require 'rails_helper'

RSpec.describe Resident, type: :model do
  describe 'Authentication' do

    subject do
      described_class.new(
        { 
          full_name: 'José Antônio',
          cpf: '60755290046',
          cns: '915907452330002',
          email: 'jose@test.com',
          phone: '11999999999',
          birth_date: Date.today - 30.years
        }
      )
    end

    context 'given valid parameters' do
      it 'is valid with correct attributes' do
        expect(subject).to be_valid
      end
    end

    context 'given invalid parameters' do
      it 'is not valid without a full_name' do
        subject.full_name = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a cpf' do
        subject.cpf = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without an email' do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without a phone' do
        subject.phone = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid with an invalid cpf' do
        subject.cpf = '2'
        expect(subject).to_not be_valid
      end

      it 'is not valid with an invalid cns' do
        subject.cns = '2'
        expect(subject).to_not be_valid
      end

      it 'is not valid with an invalid birth_date' do
        subject.birth_date = DateTime.now + 1.years
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'resident model search function' do
    
    let!(:resident_jose) { 
      Resident.create(
        { 
          full_name: 'José Antônio',
          cpf: '60755290046',
          cns: '915907452330002',
          email: 'jose@test.com',
          phone: '11999999999',
          birth_date: Date.today - 30.years,
          address_attributes: {
            postal_code: Faker::Address.zip_code,
            public_address: Faker::Address.street_name,
            district: Faker::Address.street_suffix,
            city: Faker::Address.city,
            state_code: Faker::Address.state_abbr  
          }
        }
      )
    }

    let!(:resident_maria) { 
      Resident.create(
        { 
          full_name: 'Maria Rita',
          cpf: '91793695024',
          cns: '135001846320002',
          email: 'maria@test.com',
          phone: '11999998888',
          birth_date: Date.today - 40.years,
          address_attributes: {
            postal_code: Faker::Address.zip_code,
            public_address: Faker::Address.street_name,
            district: Faker::Address.street_suffix,
            city: Faker::Address.city,
            state_code: Faker::Address.state_abbr  
          }
        }
      )
    }

    it 'should return José Antônio' do
      expect(Resident.search('José').first).to eq(resident_jose)
    end

    it 'should return Maria Rita' do
      expect(Resident.search('Maria').first).to eq(resident_maria)
    end

    it 'should return both residents' do
      expect(Resident.search('9999').count).to eq(2)
    end

    it 'should return no residents' do
      expect(Resident.search('Marcio').count).to eq(0)
    end
  end
end
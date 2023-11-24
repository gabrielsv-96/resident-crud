require 'rails_helper'

RSpec.describe ResidentsController do
  resident = { 
    full_name: 'Nome teste',
    cpf: '60755290046', 
    cns: '915907452330002',
    email: 'email@test.com',
    phone: '11999999999',
    birth_date: Date.today - 30.years
  }

  it 'should list all residents' do
    new_resident = Resident.new(resident)
    new_resident.save

    get :index
    expect(Resident.count).to eq(1)
    expect(response).to have_http_status(200)
  end

  it 'should redirect to resident visualization' do
    new_resident = Resident.new(resident)
    new_resident.save

    get :show, params: { id: new_resident.id }
    expect(response).to have_http_status(200)
  end

  it 'should be able to create a resident' do
    post :create, params: { resident: resident }

    expect(Resident.count).to eq(1)
    expect(Resident.first.full_name).to eq('Nome teste')
    expect(Resident.first.cpf).to eq('60755290046')
    expect(Resident.first.cns).to eq('915907452330002')
    expect(response).to have_http_status(302)
  end

  it 'should be able to update a resident' do
    updated_resident = Resident.new(resident)
    updated_resident.save

    patch :update, params: { id: updated_resident.id, resident: { full_name: 'Updated Name' } }

    expect(Resident.first.full_name).to eq('Updated Name')
    expect(response).to redirect_to(residents_path)
  end
end
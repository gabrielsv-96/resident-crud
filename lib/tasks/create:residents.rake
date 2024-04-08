namespace :create do
  task residents: :environment do
    for i in 0..30 do
      puts "Inserting the resident number #{i}"
      Resident.create!(
        full_name: Faker::Name.name,
        cpf: CPF.generate,
        email: Faker::Internet.email,
        birth_date: Time.now,
        phone: Faker::PhoneNumber.phone_number,
        address_attributes: {
          postal_code: Faker::Address.zip_code,
          public_address: Faker::Address.street_name,
          district: Faker::Address.street_suffix,
          city: Faker::Address.city,
          state_code: Faker::Address.state_abbr
        }
      )
    end
  end
end
class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.string :public_address, null: false
      t.string :adjunct
      t.string :district, null: false
      t.string :city, null: false
      t.string :state_code, null: false
      t.string :ibge_code
      t.references :resident, foreign_key: true

      t.timestamps
    end
  end
end

class CreateResidents < ActiveRecord::Migration[5.2]
  def change
    create_table :residents do |t|
      t.string :full_name, null: false
      t.string :cpf, null: false
      t.string :cns, null: false
      t.string :email, null: false
      t.date :birth_date, null: false
      t.string :phone, null: false
      t.boolean :active, default: true
      
      t.timestamps
    end
  end
end

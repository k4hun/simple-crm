class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :voivodeship
      t.boolean :visible, default: false

      t.timestamps null: false
    end
  end
end

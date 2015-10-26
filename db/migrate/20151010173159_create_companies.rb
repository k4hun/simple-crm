class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :client_id
      t.boolean :visible, default: false
      t.datetime :end_date
      t.text :description

      t.timestamps null: false
    end
  end
end

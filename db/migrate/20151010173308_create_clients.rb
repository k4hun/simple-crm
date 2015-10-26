class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.integer :nip, :limit => 10
      t.text :comment
      t.boolean :visible, default: false

      t.timestamps null: false
    end
  end
end

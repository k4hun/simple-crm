class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :type
      t.string :value
      t.integer :client_id
      t.integer :company_id

      t.timestamps null: false
    end
  end
end

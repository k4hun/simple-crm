class FixClientNameColumn < ActiveRecord::Migration
  def change
    rename_column :clients, :firstname, :name
    remove_column :clients, :lastname
  end
end

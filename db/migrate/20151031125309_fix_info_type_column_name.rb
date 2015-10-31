class FixInfoTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :infos, :type, :info_type
  end
end

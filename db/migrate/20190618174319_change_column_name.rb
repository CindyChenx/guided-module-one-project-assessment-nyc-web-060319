class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :holidays, :type, :type_of_holiday
  end
end

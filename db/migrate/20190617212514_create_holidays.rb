class CreateHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :holidays do |t|
      t.string :date
      t.string :description
      t.string :name
      t.string :type
    end
  end



end

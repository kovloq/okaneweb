class Fixcolumn < ActiveRecord::Migration
  def change
  	rename_column :incomes, :category, :category_id
  	rename_column :expenses, :category, :category_id
  end
end

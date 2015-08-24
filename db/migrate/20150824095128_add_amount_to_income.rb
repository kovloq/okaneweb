class AddAmountToIncome < ActiveRecord::Migration
  def change
    add_column :incomes, :amount, :integer
    add_column :expenses, :amount, :integer
  end
end

class AddDateToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :date, :date
    add_column :transactions, :description, :text
    add_column :transactions, :category_id, :integer
    rename_column :transactions, :transaction_name, :name
    rename_column :transactions, :user_id, :member_id
    rename_column :transactions, :value, :amount
    rename_column :transactions, :category, :t_category
  end
end

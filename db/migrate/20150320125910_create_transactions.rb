class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :transaction_name
      t.string :tags
      t.integer :category
      t.integer :value
      t.datetime :created_at
      t.integer :created_by
      t.datetime :updated_at
      t.integer :updated_by
      t.boolean :delete_flag

      t.timestamps
    end
  end
end

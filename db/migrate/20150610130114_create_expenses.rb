class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :category
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end

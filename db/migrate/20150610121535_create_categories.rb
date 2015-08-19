class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color
      t.integer :tipe,:limit => 2
      t.text :description

      t.timestamps
    end
  end
end

class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :title
      t.text :description
      t.integer :order

      t.timestamps
    end
  end
end

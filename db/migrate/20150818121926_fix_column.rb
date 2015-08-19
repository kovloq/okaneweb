class FixColumn < ActiveRecord::Migration
  def change
     rename_column :categories, :type, :tipe
  end
end

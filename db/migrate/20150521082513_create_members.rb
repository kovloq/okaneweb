class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :image
      t.string :email
      t.string :password
      t.string :gender
      t.date :birthdate


      t.timestamps
    end
  end
end

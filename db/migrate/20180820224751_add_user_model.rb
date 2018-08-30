class AddUserModel < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :isbn
      t.string :edition
      t.string :author
      t.string :publisher
      t.integer :copies
      t.integer :price
      t.text :description
      t.timestamps
    end

    create_table :members do |t|
      t.string :roll_no
      t.string :first_name
      t.string :last_name
      t.string :program
      t.timestamps
    end
  end
end

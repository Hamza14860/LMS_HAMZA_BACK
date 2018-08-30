class AddForeignKeyisbnInIssue < ActiveRecord::Migration[5.2]
  def change
    #ADDING EMAIL AND PASSWORD TO MEMBER
  #  add_foreign_key :issues, :books, column: :isbn, primary_key: "isbn"
  #  add_foreign_key :issues, :members, column: :roll_no, primary_key: "roll_no"

    add_column :members, :email, :string
    add_column :members, :password, :string

  end
end

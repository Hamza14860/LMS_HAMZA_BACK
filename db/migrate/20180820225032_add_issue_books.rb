class AddIssueBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.integer :book_id, references: :books
      t.integer :member_id, references: :members
      t.date :issue_date
      t.date :due_date
      t.integer :fine
      t.date :return_date
      t.timestamps
    end
  end
end

class CreateBooksOnLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :books_on_loans do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end

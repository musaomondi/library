class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :category
      t.string :title
      t.string :author
      t.string :isbn
      t.integer :available

      t.timestamps
    end
  end
end

class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :customer_id
      t.integer :equipment_id
      t.string :status_loan
      t.boolean :confirmation_loan
      t.text :comment
      t.integer :user_id
      t.integer :technical_id

      t.timestamps
    end
  end
end

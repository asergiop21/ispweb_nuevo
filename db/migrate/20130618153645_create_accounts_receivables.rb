class CreateAccountsReceivables < ActiveRecord::Migration
  def change
    create_table :accounts_receivables do |t|
      t.string :description, :precision => 8, :scale => 2
      t.decimal :amount, :precision => 8, :scale => 2
      t.decimal :number_invoice
      t.integer :customer_id
      t.integer :user_id

      t.timestamps
    end
  end
end

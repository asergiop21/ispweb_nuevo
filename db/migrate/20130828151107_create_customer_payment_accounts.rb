class CreateCustomerPaymentAccounts < ActiveRecord::Migration
  def change
    create_table :customer_payment_accounts do |t|
      t.integer :customer_id
      t.decimal :amount_depostied, :precision => 8, :scale => 2
      t.decimal :current_balance, :precision => 8, :scale => 2
      t.decimal :debt, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end

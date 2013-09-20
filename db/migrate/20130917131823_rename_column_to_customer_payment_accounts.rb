class RenameColumnToCustomerPaymentAccounts < ActiveRecord::Migration
  def up
    rename_column :customer_payment_accounts, :amount_depostied, :amount_deposited
  end

  def down
    rename_column :customer_payment_accounts, :amount_deposited, :amount_depostied
  end
end

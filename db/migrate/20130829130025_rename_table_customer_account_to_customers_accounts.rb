class RenameTableCustomerAccountToCustomersAccounts < ActiveRecord::Migration
  def self.up
      rename_table :customers_accounts, :customer_payment_accounts
  end

  def  self.down
      rename_table :customer_payment_accounts, :customers_accounts  
  end
end

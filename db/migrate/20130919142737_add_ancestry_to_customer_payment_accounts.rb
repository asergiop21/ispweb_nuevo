class AddAncestryToCustomerPaymentAccounts < ActiveRecord::Migration
  def change
    add_column :customer_payment_accounts, :ancestry, :string
  end
end

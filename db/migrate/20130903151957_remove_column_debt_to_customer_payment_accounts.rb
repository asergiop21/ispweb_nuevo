class RemoveColumnDebtToCustomerPaymentAccounts < ActiveRecord::Migration
  def up
      remove_column :customer_payment_accounts, :debt
  end

  def down
      add_column :customer_patment_accounts, :debt, :decimal, :precision => 8, :scale => 2
  end
end

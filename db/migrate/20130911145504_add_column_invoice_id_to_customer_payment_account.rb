class AddColumnInvoiceIdToCustomerPaymentAccount < ActiveRecord::Migration
  def self.up
          add_column :customer_payment_accounts, :invoice_id, :integer
  end

  def self.down
          remove_column :customer_payment_accounts, :invoice_id
  end
end

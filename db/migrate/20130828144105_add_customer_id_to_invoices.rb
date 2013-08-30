class AddCustomerIdToInvoices < ActiveRecord::Migration
  def self.up
      add_column :invoices, :customer_id, :integer
      add_column :invoices, :debit, :decimal, :precision => 8, :scale => 2
      add_column :invoices, :credit, :decimal, :precision => 8, :scale => 2
      add_column :invoices, :status, :boolean
  end

  def self.down
  
      remove_column :invoices, :customer_id
      remove_column :invoices, :debit
      remove_column :invoices, :credit
      remove_column :invoices, :status
  end
end

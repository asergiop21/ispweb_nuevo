class ChangetypeNumberInvoiceToAccountsReceivables < ActiveRecord::Migration
  def self.up
      change_column :accounts_receivables, :number_invoice, :integer
  end

  def self.down
      change_column :accounts_receivables, :number_invoice, :numeric
  end
end

class ChangetypeNumberInvoiceToAccountReceivables < ActiveRecord::Migration
  def self.up
      change_column :account_receivables, :number_invoice, :integer
  end

  def self.down
      change_column :account_receivables, :number_invoice, :numeric
  end
end

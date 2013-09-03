class AddColumnTotalToPayToInvoices < ActiveRecord::Migration
  def self.up
      add_column :invoices, :total_to_pay, :decimal, :precision => 8, :scale => 2
  end


  def self.down
      remove_column :invoices, :total_to_pay
  end
end

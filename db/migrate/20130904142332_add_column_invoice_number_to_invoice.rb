class AddColumnInvoiceNumberToInvoice < ActiveRecord::Migration
  def self.up
      add_column :invoices, :number_invoice, :serial
      #say "Creating Sequenze for Customer number starting at 1002"
      #execute 'CREATE SEQUENCE number_invoice_seq START 1002'
  end

  def self.down

    remove_column :invoices, :number_invoice 
#    execute "Drop SEQUENCE number_invoice_seq"

end





end

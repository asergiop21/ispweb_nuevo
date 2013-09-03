class AddChangeStatusDefaultToInvoice < ActiveRecord::Migration
  def self.up
     change_column :invoices, :status, :boolean,  :default => false
  end
end

class AddInvoiceToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :invoice, :string
  end
  def self.down
    remove_column :customers, :invoice, :string
  end

end

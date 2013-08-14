class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number_invoice, :default => 1000
      t.timestamps
    end
  end
end

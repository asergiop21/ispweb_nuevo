class AddColumnDebtToInovices < ActiveRecord::Migration
  def self.up
      add_column :invoices, :debt, :decimal, :precision =>8, :scale => 2
  end

  def self.down
      remove_column :invoices, :debt
  end

end

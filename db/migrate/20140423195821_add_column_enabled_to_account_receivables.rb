class AddColumnEnabledToAccountReceivables < ActiveRecord::Migration
  

  def self.up
      add_column :account_receivables, :enabled, :boolean, :default => false
  end

  def self.down
      remove_column :account_receivables, :enabled
  end
end

class RenameTableAccountsReicevableToAccountsReceivables < ActiveRecord::Migration
  def self.up
      rename_table :accounts_receivables, :account_receivables
  end

  def self.down
      rename_table :account_receivables, :accounts_receivables
  end
end

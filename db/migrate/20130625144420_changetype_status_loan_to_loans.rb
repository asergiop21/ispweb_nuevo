class ChangetypeStatusLoanToLoans < ActiveRecord::Migration
  def self.up
      remove_column :loans, :status_loan
      add_column :loans, :status_loan, :boolean, :default => true
      Loan.reset_column_information 
  end

  def self.down
    remove_column :loans, :status_loan
    add_column :loans, :status_loan, :string
  end
end

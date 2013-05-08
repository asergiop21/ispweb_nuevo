class ChangeIssueTypeString < ActiveRecord::Migration
  def up
      change_column :tickets, :issue, :string
  end

  def down
      change_column :tickets, :issue, :string
  end
end

class ChangeColumnStatusToTickets < ActiveRecord::Migration
  def up
    change_column :tickets, :status, :boolean, :default => false
  end

  def down
    change_column :tickets, :status, :boolean
  end
end

class ChangePriorityTypeStringToTicket < ActiveRecord::Migration
  def up
    change_column :tickets, :priority, :string
  end

  def down
    change_column :tickets, :priority, :integer
  end
end

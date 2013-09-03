class ChangeTypeStatusToTickets < ActiveRecord::Migration
  def up
    change_column :tickets, :status, :string, :default => 'pendiente'
  end

  def down
    change_column :tickets, :status, :boolen, :default => 'false'
  end
end

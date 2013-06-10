class RenameDepartametToTicket < ActiveRecord::Migration
  def up
    rename_column :tickets, :departament, :role_id
  end

  def down
    rename_column :tickets, :role_id, :departament
  end
end

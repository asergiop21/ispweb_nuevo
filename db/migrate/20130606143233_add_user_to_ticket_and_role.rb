class AddUserToTicketAndRole < ActiveRecord::Migration
  def self.up
    add_column :ticket_and_roles, :user_id, :integer
  end

  def self.down
    remove_column :ticket_and_roles, :user_id, :integer
  end
end

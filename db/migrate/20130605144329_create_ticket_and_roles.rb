class CreateTicketAndRoles < ActiveRecord::Migration
  def change
    create_table :ticket_and_roles do |t|
      t.belongs_to :ticket
      t.belongs_to :role

      t.timestamps
    end
  end
end

class AddAncestryToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :ancestry, :string
    add_index :tickets, :ancestry
  end
  def self.down
    remove_index :tickets, :ancestry
    remove_column :tickets, :ancestry
  end
end

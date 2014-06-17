class AddColumnPrioritycssToTickets < ActiveRecord::Migration
  def self.up
      add_column :tickets, :prioritycss, :string 
  end
  
  def self.down
      remove_column :tickets, :prioritycss, :string 
  end

end

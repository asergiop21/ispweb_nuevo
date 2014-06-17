class AddPlanTimeToPlan < ActiveRecord::Migration
  def self.up
      add_column :plans, :start_time, :time
      add_column :plans, :end_time, :time
      
  end

  def self.down
      add_column :plans, :start_time, :time
      add_column :plans, :end_time, :time
      
  end
end

class AddPlanesToPlanes < ActiveRecord::Migration
  def self.up 
      add_column :plans, :support_priority, :integer
      add_column :plans, :percentage_junk, :integer
      add_column :plans, :upload_speed_vampire, :string
      add_column :plans, :download_speed_vampire, :string
      add_column :plans, :percentage_junk_vampire, :string
  end

  def self.down
      remove_column :plans, :support_priority, :integer
      remove_column :plans, :percentage_junk, :integer
      remove_column :plans, :upload_speed_vampire, :string
      remove_column :plans, :download_speed_vampire, :string
      remove_column :plans, :percentage_junk_vampire, :string
  end


end

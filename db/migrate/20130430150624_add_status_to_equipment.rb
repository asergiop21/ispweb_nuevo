class AddStatusToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :status, :string
    remove_column :equipment, :state 
  end
end

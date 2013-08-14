class ChangeColumnStatusToEquipment < ActiveRecord::Migration
  def self.up
      change_column :equipment, :status, :string, :default => 'STOCK'
      add_column :equipment, :enabled, :boolean, :default => true
  end

  def self.down
      change_column :equipment, :status, :string
      remove_column :equipment, :enabled, :boolean
  end
end

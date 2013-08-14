class AddEnableToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :enable_vampire, :boolean, :default => false
  end

  def self.down
    remove_column :plans, :enable_vampire
  end
end

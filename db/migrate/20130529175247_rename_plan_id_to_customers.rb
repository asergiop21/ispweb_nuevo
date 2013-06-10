class RenamePlanIdToCustomers < ActiveRecord::Migration
  def up
    rename_column :customers, :plans_id, :plan_id
  end

  def down
    rename_column :customers, :plan_id, :plans_id
  end
end

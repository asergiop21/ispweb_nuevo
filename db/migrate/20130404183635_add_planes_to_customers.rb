class AddPlanesToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :plans_id, :integer
  end
end

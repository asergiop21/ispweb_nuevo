class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :ip_ap
      t.string :ip_device
      t.integer :plan_id

      t.timestamps
    end
  end
end

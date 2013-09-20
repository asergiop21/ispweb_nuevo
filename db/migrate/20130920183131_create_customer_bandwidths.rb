class CreateCustomerBandwidths < ActiveRecord::Migration
  def change
    create_table :customer_bandwidths do |t|
      t.string :customer
      t.string :ip_device
      t.integer :mdr
      t.integer :mup
      t.integer :gdr
      t.integer :gur

      t.timestamps
    end
  end
end

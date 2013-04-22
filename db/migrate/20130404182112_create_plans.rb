class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :upload_speed
      t.string :download_speed
      t.boolean :remove
      t.decimal :price_surcharges1, :precision=>8, :scale =>2
      t.decimal :price_surcharges2, :precision =>8, :scale =>2
      t.integer :user_id
      t.timestamps
    end
  end
end
